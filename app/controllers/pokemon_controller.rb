require 'poke-api-v2'

class PokemonController < ApplicationController
  def viewPokemon
    @pokemon = PokeApi.get(pokemon: params[:id])
  end
end