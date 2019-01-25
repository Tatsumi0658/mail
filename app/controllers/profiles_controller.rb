class ProfilesController < ApplicationController
  before_action:set_prof, only:[:edit,:update,:destroy,:show]
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(prof_params)
    if @profile.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.save
      redirect_to posts_path
    else
      render :edit
    end
  end

  def show
  end

  def index
  end

  private
  def set_prof
    @profile = Profile.find(params[:id])
  end

  def prof_params
    params.require(:profile).permit(:username, :image, :image_cache)
  end
end
