Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:index, :new, :create]
  resources :favourites, only: [:index, :create, :destroy]
  

  get '/pokedex' => 'pages#pokedex'
  get '/pokedex/1/pokemon' => 'pokedex#pokemon1List'
  get '/pokedex/2/pokemon' => 'pokedex#pokemon2List'
  get '/pokedex/3/pokemon' => 'pokedex#pokemon3List'
  get '/pokedex/4/pokemon' => 'pokedex#pokemon4List'
  get '/pokedex/5/pokemon' => 'pokedex#pokemon5List'
  get '/pokedex/6/pokemon' => 'pokedex#pokemon6List'
  get '/pokedex/7/pokemon' => 'pokedex#pokemon7List'

  get '/pokemon/favorites' => 'favorites#favoritePokemon'
  post '/pokemon/:id' => 'favorites#favoritePokemon'
  
  get '/pokemon/:id' => 'pokemon#viewPokemon'
  post '/pokemon/:id' => 'pokemon#viewPokemon'

  get '/search' => 'pages#searchPokemon'
  
  get '/search' => 'pages#searchPokemon'
  post '/search/byname/:id' => 'pokemon#viewPokemon'
  get '/search' => 'pages#searchPokemon'
  post '/search/bytype/:id' => 'search#byType'



  get '/login' => 'session#new' # session controller
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
