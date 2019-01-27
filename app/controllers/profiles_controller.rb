class ProfilesController < ApplicationController
  before_action:set_prof, only:[:edit,:update,:destroy,:show]
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(prof_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to posts_path
      flash[:success] = "プロフィールを作成しました"
    else
      flash.now[:danger] = "失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.user_id == current_user.id
      @profile.update(prof_params)
      if @profile.valid?
        redirect_to posts_path
        flash[:success] = "プロフィールを更新しました"
      else
        flash[:danger] = "プロフィールの更新に失敗しました"
        render :edit
      end
    else
      flash[:danger] = "更新権限がありません"
      redirect_to posts_path
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
      @posts = Post.where(profile_id: set_prof.id).all
    end
  end

  private
  def set_prof
    @profile = Profile.find(params[:id])
  end

  def prof_params
    params.require(:profile).permit(:username, :image, :introduce)
  end
end
