class SendOtpMailer < ApplicationMailer
  default from: 'democheck87@gmail.com'

  def send_otp_email
    @email = params[:email]
    mail(to: @email, subject: "Otp Generation")
  end
end
