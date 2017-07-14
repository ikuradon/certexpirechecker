require "sidekiq/web"
require "sidekiq-scheduler/web"

Rails.application.routes.draw do
  resources :instances
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
end
