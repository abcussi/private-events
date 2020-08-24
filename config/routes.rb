Rails.application.routes.draw do
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout'      , to: 'sessions#destroy'
  root to: "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
end
