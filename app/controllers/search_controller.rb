require 'poke-api-v2'

class SearchController < ApplicationController
  def getByType
    @pokemontype = PokeApi.get(type: params[:type].downcase)
    @pokemontypename = @pokemontype.name
    @pokemonlist = @pokemontype.pokemon
    render :typeList
  end

  def getSearchPokemon
    @pokemon = PokeApi.get(pokemon: params[:id])
    maxPokemonId = 1010
    @everyPokemon = PokeApi.get(pokemon: {limit: maxPokemonId, page: 1}).results
    @everyType = PokeApi.get(:type).results
    if params[:name] != ""
      @pokemon = PokeApi.get(pokemon: params[:name])
    elsif params[:type] != ""
       @pokemon = PokeApi.get(pokemon: params[:type])
    end
    render :searchPokemon
  end

  def getResult
    @pokemon = PokeApi.get(pokemon: params[:pokemon_name].downcase)
    redirect_to pokemon_path(@pokemon.id)
  end
end