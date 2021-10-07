class ContactMailer < ApplicationMailer
  def thanks(contact)
    @contact = contact
    mail(to: @contact.email, subject: 'Thank you for your message')
  end

  def new_contact_submission(contact)
    @contact = contact
    mail(to: "Cesare Ferrari<cesare@hey.com>", subject: 'New contact created')
  end
end
