Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :profiles, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hedgies, only: [:new, :show, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :index]
  end
  resources :hedgies, only: [:create, :search]
  mount Attachinary::Engine => "/attachinary"
end
