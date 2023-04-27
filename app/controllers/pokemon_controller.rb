require 'poke-api-v2'

class PokemonController < ApplicationController
  def viewPokemon
    @pokemon = PokeApi.get(pokemon: params[:id])
  end

  def favoritePokemon
    @favorites = current_user.favorites
  end
  
  def favorite
    @pokemon_id = PokeApi.get(pokemon: params[:id])
    current_user.favorites.create(pokemon_id: @pokemon_id)
    redirect_to pokemon_favorites_path
  end


end