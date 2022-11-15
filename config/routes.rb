require 'sidekiq/web'
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  # mount Sidekiq::Web => 'http://localhost:3000/sidekiq'
  namespace 'api' do
    namespace 'v1' do
      # resources :mailer 
      get 'mailer/send_mail', to: 'mailer#send_mail', as: 'send_mail'
      get 'sms/send_message', to: 'sms#send_message', as: 'send_message'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
