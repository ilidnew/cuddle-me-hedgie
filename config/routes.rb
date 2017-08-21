Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bookings, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :hedgies, only: [:create, :search]
  resources :hedgies, only: [:new, :show], as: :hedgie
end
