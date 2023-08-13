Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:index, :new, :create]
  resources :favorites
  

  get '/pokedex' => 'pages#pokedex'
  get '/pokedex/1/pokemon' => 'pokedex#pokemon1List'
  get '/pokedex/2/pokemon' => 'pokedex#pokemon2List'
  get '/pokedex/3/pokemon' => 'pokedex#pokemon3List'
  get '/pokedex/4/pokemon' => 'pokedex#pokemon4List'
  get '/pokedex/5/pokemon' => 'pokedex#pokemon5List'
  get '/pokedex/6/pokemon' => 'pokedex#pokemon6List'
  get '/pokedex/7/pokemon' => 'pokedex#pokemon7List'

  get '/pokemon/favorites' => 'favorites#index'
  post '/favorites/:id' => 'favorites#create', :as => 'favorite_pokemon'
  
  get '/pokemon/:id' => 'pokemon#show', :as => 'pokemon'

  get '/search' => 'search#getSearchPokemon'
  get '/search/result' => 'search#getResult'
  get '/search/byType/:type' => 'search#getByType', :as => 'search_by_type'

  get '/login' => 'session#new' # session controller
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
