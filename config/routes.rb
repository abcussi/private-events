Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/crete'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'events/new'
  get 'events/create'
  get 'events/show'
  get 'events/index'
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
end
