class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.new_contact_submission(@contact).deliver_now
      ContactMailer.thanks(@contact).deliver_now
      redirect_to contacts_url
    else
      flash[:alert] = "Contact not saved"
      render :new
    end
  end

  def index
    @contacts = Contact.all
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
