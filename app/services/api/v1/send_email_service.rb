module Api
  module V1
    module SendEmailService
      class << self
        def call(type, email)
          response = process(type, email)
          {success: response[:success], message: response[:message]}
        end
        
        private
    
        def process(type, email)
          case type
          when "sign_up_success"
            if SignupCompletionMailer.with(email: email).sign_up_confirmation_email.deliver_now
              success, message = true, "The mail has been sent"
            else
              success, message = false, "mail not sent"
            end
          when "send_otp"
            if SendOtpMailer.with(email: email).send_otp_email.deliver_now
              success, message = true, "The otp mail has been sent"
            else
              success, message = false, "mail not sent"
            end
          when "password_update"
            if UpdatePasswordMailer.with(email: email).update_password_email.deliver_now
              success, message = true, "The Password is updated mail has been sent"
            else
              success, message = false, "mail not sent"
            end
          end
          {success: success, message: message}
        end
      end 
    end 
  end 
end

