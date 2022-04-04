Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'mainpage#index'
  resources :user, only: [:show]
end
