Rails.application.routes.draw do


  #get "articles", to:"articles#index"
  get "new-article", to:"articles#new"
  resources :results
  resources :answers
  resources :questions


  resources :courses, only:[:show] do
    resources :exercises, only:[:new, :create, :destroy, :edit, :update]
    get "exercises", to:"exercises#index"
  end
  
  ############ Exercises  ###############
  resources :exercises, except: [:new, :show, :edit, :create, :update, :destroy, :index] do
    member do
      delete 'delete', to: 'exercises#destroy'
    end
    resources :questions, only: [:new, :create, :destroy]
    resources :results, only: [:new, :create]
  end
  
  resources :articles, except: [:new]
  resources :courses, except:[:index, :show, :new]
  resources :questions, except:[:new, :create, :destroy]
  resources :materials, :levels, :citynames
  
  devise_scope :user do
    get 'profil', to: 'devise/registrations#edit'
    get 'student-sign-in', to: 'devise/sessions#new'
    get 'student-sign-up', to: 'devise/registrations#new', as: "new_user_registration"
    delete 'deconnecter',  to: "devise/sessions#destroy", as: "destroy_user_session_path"
  end
devise_for :users
  

  get "new-course", to:"courses#new"
  get "new-level", to:"levels#new"
  get "new-material", to:"materials#new"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homepage#index"
end
