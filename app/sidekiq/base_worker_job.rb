require 'json'
class BaseWorkerJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform(type, complete_number)
    case type
    when "sign_up_message"
      @client = Twilio::REST::Client.new(@account_sid, @auth_token) 
      res = @client.messages.create(
        from:Rails.application.credentials.twilio_phone_number,
        body: "Hello you have registered for the app!",      
        to: '+917869967891' 
      )
      # debugger
      # if res.status == "queued"
      #   success, message = true, "The message has been sent"
      # else
      #   success, message = false, "The message has not been sent"
      # end
    when "generate_otp"
      otp = Random.rand(999..9999)
      @client = Twilio::REST::Client.new(@account_sid, @auth_token) 
      res =@client.messages.create(
        from:Rails.application.credentials.twilio_phone_number,
        body: "The Otp generated for your app is #{otp}",      
        to: '+917869967891' 
      )
    #   if res&.status == "queued"
    #     success, message = true, "The otp #{otp} message has been sent"
    #   else
    #     success, message = false, "The otp message has not been sent"
    #   end
    end
    # {success: success, message: message}
  end
end
