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
    else
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
      else
        render :edit
      end
    else
      redirect_to posts_path
    end
  end

  def show
    @posts = Post.where(profile_id: set_prof.id).all
  end

  private
  def set_prof
    @profile = Profile.find(params[:id])
  end

  def prof_params
    params.require(:profile).permit(:username, :image, :introduce)
  end
end
