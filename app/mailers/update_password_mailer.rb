class UpdatePasswordMailer < ApplicationMailer
  default from: 'democheck87@gmail.com'

  def update_password_email
    @email = params[:email]
    mail(to: @email, subject: "Password Updated")
  end
end
