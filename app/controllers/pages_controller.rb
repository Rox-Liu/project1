require 'poke-api-v2'

class PagesController < ApplicationController
  def home
    @pokemon = PokeApi.get(pokemon: 'bulbasaur')

  end

  def pokedex
    @region1 = PokeApi.get(region: 1)
    @region2 = PokeApi.get(region: 2)
    @region3 = PokeApi.get(region: 3)
    @region4 = PokeApi.get(region: 4)
    @region5 = PokeApi.get(region: 5)
    @region6 = PokeApi.get(region: 6)
    @region7 = PokeApi.get(region: 7)
  end

  def searchPokemon
    @pokemon = PokeApi.get(pokemon: params[:id])
  end
  

end
