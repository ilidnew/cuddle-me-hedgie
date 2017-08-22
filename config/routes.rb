Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :bookings, only: [:new, :create]do
    resources :comments, only: [:new, :create, :destroy]
  end

  resources :profiles, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :hedgies, only: [:create, :search, :destroy]
  resources :hedgies, only: [:new, :show, :edit, :update, :destroy], as: :hedgie
  mount Attachinary::Engine => "/attachinary"
end
