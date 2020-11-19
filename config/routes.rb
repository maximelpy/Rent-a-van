Rails.application.routes.draw do
  devise_for :users
  root to: 'vans#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :vans  do
    resources :bookings, only: [:new, :create]
    resources :ratings, only: [:index, :show, :update, :destroy]
  end
  resources :bookings, only: [:index, :show, :update, :destroy]
end
