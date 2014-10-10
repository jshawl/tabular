Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, :organizations do
    resources :links
  end
end
