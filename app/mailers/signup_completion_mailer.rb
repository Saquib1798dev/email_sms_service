class SignupCompletionMailer < ApplicationMailer
  default from: 'democheck87@gmail.com'

  def sign_up_confirmation_email
    @email = params[:email]
    mail(to: @email, subject: "Sign up Completion!")
  end
end
