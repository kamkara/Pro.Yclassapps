Rails.application.routes.draw do
  resources :courses
  resources :articles
  resources :citynames
  resources :materials
  resources :levels
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homepage#index"
end
