class ContactMailMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to:"1ec183852a@gmail.com", subject:"お問い合わせの確認メール"
  end
end
