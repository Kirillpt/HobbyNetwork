Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :user, only: [:show]
  resources :category, param: :slug
  resources :post, only: [:show], param: :slug
  root 'mainpage#index'
end
