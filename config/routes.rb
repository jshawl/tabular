Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :organizations
  resources :users
end
