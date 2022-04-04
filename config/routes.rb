Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'mainpage#index'
  get '/user/:id', to: "user#show"
end
