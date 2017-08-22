Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :profiles, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hedgies do
    resources :bookings, only: [:new, :create, :index]
  end
  mount Attachinary::Engine => "/attachinary"
end
