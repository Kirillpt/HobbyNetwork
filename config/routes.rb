Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:show]
  resources :categories, param: :slug
  resources :posts,  param: :slug
  root 'mainpages#index'
  get 'homepage', to: 'mainpages#homepage'
end
