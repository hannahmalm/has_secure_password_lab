Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #higest priority goes at the top 

  #these will now be standard for new, create, and destroying sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  #a user controller can call new and create - create a new user 
  resources :users, only: [:new, :create]

  root 'welcome#home'
end
