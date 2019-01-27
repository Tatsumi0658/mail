class RegisterMailer < ApplicationMailer

  def register_mail
    @user = params[:user]
    mail(to: @user.email, subject: "ご登録いただきありがとうございます")
  end
end
