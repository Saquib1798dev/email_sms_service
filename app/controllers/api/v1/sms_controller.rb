module Api
  module V1
    class SmsController < ApplicationController
      def send_message
        response = Api::V1::SendMessageService.call(params[:sms_type], params[:complete_number])
        render json: {message: "The message would have been sent to you"}
      end
    end
  end
end
