class ContactUsMailer < ApplicationMailer

  def send_message(contact_form)
    @contact = contact_form
    mail(to: @contact.email, subject: '[MGF] Contact Us Message')
  end

end
