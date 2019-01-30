class PostMailer < ApplicationMailer
  def post_mail
    @post_user = params[:user]
    mail(to: @post_user.email, subject:"投稿が完了しました")
  end
end
