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
    if @user.id == current_user.id
      @user.update(user_params)
      if @user.valid?
        redirect_to posts_path
      else
        render :edit
      end
    else
      redirect_to posts_path
    end
  end

  def destroy
    if @user.user_id == current_user.id
      @user = User.destroy
      redirect_to new_user_path
    else
      redirect_to posts_path
    end
  end

  private
  def set_account
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
