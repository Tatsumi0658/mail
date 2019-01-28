class UsersController < ApplicationController
  before_action:set_account, only:[:show, :edit, :destroy, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      RegisterMailer.with(user: @user).register_mail.deliver
      redirect_to new_session_path
      flash[:success] = "ユーザー登録が完了しました。ご登録いただいたメールアドレスに完了メールをお送りしておりますので、ご確認ください"
    else
      flash.now[:danger] = "ユーザー登録に失敗しました。今一度入力をお願い致します。"
      render :new
    end
  end

  def index
    #redirect_to new_user_path
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
        flash[:success] = "更新しました"
      else
        flash[:danger] = "更新に失敗しました。今一度ご確認をお願いします"
        render :edit
      end
    else
      redirect_to posts_path
      flash[:danger] = "更新権限がありません"
    end
  end

  def destroy
    if @user.id == current_user.id
      @user.destroy
      redirect_to new_user_path
      flash[:success] = "アカウントを削除しました"
    else
      redirect_to posts_path
      flash[:danger] = "削除できませんでした"
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
