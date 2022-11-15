Twilio.configure do |config|
  config.account_sid = Rails.application.credentials.twilio_account_sid
  config.auth_token = Rails.application.credentials.twilio_auth_token
end


# client = Twilio::REST::Client.new
# client.messages.create({
#   from: Rails.application.credentials.twilio_phone_number,
#   to: '917869967891',
#   body: 'Hello there! This is a test'
# })


# client = Twilio::REST::Client.new
# client.messages.create(
#   from: Rails.application.credentials.twilio_phone_number,
#   to: '+917869967891',
#   body: "The Otp is #{random_number}" 
# )