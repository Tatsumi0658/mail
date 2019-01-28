class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailMailer.contact_mail(@contact).deliver
      redirect_to posts_path
      flash[:success] = "お問い合わせいただき、ありがとうございます。"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:email,:content)
  end
end
