Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :organizations
  resources :users do
    resources :links
  end
end
