module Api
  module V1
    class MailerController < ApplicationController
      def send_mail
        response = Api::V1::SendEmailService.call(params[:type], params[:email])
        render json: {success: response[:success], message: response[:message]}
      end
    end
  end
end
