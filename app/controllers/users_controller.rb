class UsersController < ApplicationController
  before_action:set_account, only:[:show, :edit, :destroy, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.save(user_params)
    if @user.valid?
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.destroy
    redirect_to new_user_path
  end

  private
  def set_account
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
