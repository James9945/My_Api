Rails.application.routes.draw do
  use_doorkeeper
  
  devise_for :users, skip: [:sessions], controllers: {
    registrations: 'users/registrations'
  }

  # Health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check

  # Wild animals resource routes
  resources :wild_animals
   root "wild_animals#index"
end
