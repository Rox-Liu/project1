Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:index, :new, :create]

  get '/pokedex' => 'pages#pokedex'
  get '/login' => 'session#new' # session controller
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  
  
  # get 'pages/home'
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
