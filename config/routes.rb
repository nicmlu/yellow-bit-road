Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  resources :users, only: [:index, :show] do
    resources :paths, only: [:index, :show]
  end
  resources :paths do
    resources :courses, only: [:new]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
end
