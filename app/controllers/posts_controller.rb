class PostsController < ApplicationController
  before_action:set_post, only:[:edit, :update, :destroy, :show]
  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def show
    @favorite = current_profile.favorites.find_by(post_id: @post.id)
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.profile_id = current_profile.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    if @post.profile_id == current_profile.id
      @post.update(post_params)
      if @post.valid?
        redirect_to posts_path
      else
        render :edit
      end
    else
      redirect_to posts_path
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
    else
      redirect_to posts_path
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
