Rails.application.routes.draw do
  
  devise_for :users
  root 'doctors#index'

  resources :doctors
  resources :patients
  resources :appointments, only: [:new, :create, :destroy]
end
