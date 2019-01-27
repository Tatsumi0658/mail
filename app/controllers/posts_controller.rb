class PostsController < ApplicationController
  before_action:set_post, only:[:edit, :update, :destroy, :show]
  def index
    @posts = Post.all
  end

  def new
    if current_user == nil
      redirect_to new_session_path
      flash[:danger] = "ログインしてください"
    elsif current_profile == nil
      redirect_to new_profile_path
      flash[:danger] = "投稿するにはプロフィールを作成してください"
    else
      if params[:back]
        @post = Post.new(post_params)
      else
        @post = Post.new
      end
    end
  end

  def show
    if current_user.nil?
      redirect_to new_session_path
      flash[:danger] = "ここから先を閲覧するにはログインしてください"
    elsif current_profile.nil?
      redirect_to new_profile_path
      flash[:danger] = "ここから先を閲覧するにはプロフィールを作成してください"
    else
      @favorite = current_profile.favorites.find_by(post_id: @post.id)
    end
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.profile_id = current_profile.id
    if @post.save
      redirect_to posts_path, flash:{ success:"投稿しました" }
      #flash[:success] = "投稿しました"
    else
      flash[:danger] = "投稿できませんでした"
      render :new
    end
  end

  def update
    if @post.profile_id == current_profile.id
      @post.update(post_params)
      if @post.valid?
        redirect_to posts_path
        flash[:success] = "更新しました"
      else
        flash.now[:danger] = "更新できませんでした"
        render :edit
      end
    else
      redirect_to posts_path
      flash[:danger] = "更新権限がありません"
    end
  end

  def confirm
    @post = Post.new(post_params)
    @post.profile_id = current_profile.id
    render :new if @post.invalid?
  end

  def destroy
    if @post.profile_id == current_profile.id
      @post.destroy
      redirect_to posts_path
      flash[:success] = "削除しました"
    else
      redirect_to posts_path
      flash[:danger] = "削除権限がありません"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end

end
