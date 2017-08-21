Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :profiles, only: [:show, :edit, :update]
end
