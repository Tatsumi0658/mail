class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if current_profile.present?
        redirect_to posts_path
        falsh[:success] = "ログインに成功しました"
      else
        redirect_to new_profile_path
        flash[:warning] = "まずはプロフィールを作成しましょう"
      end
    else
      flash[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:danger] = "ログアウトしました"
    redirect_to new_session_path
  end
end
