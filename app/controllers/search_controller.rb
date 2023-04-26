require 'poke-api-v2'

class SearchController < ApplicationController
  def byName
    @pokemon = PokeApi.get(pokemon: params[:id])
    
  end

  def byType
    @pokemontype = PokeApi.get(type: params[:id])
    @pokemontypename = @pokemontype.name
    @pokemonlist = @pokemontype.pokemon
  end
end