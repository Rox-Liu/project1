require 'poke-api-v2'

class PokedexController < ApplicationController
  def pokemon1List
    @pokedex2 = PokeApi.get(pokedex: 2)
    @pokemons = @pokedex2.pokemon_entries
  end

  def pokemon2List
    @pokedex7 = PokeApi.get(pokedex: 7)
    @pokemons = @pokedex7.pokemon_entries
  end

  def pokemon3List
    @pokedex15 = PokeApi.get(pokedex: 15)
    @pokemons = @pokedex15.pokemon_entries
  end

  def pokemon4List
    @pokedex6 = PokeApi.get(pokedex: 6)
    @pokemons = @pokedex6.pokemon_entries
  end

  def pokemon5List
    @pokedex9 = PokeApi.get(pokedex: 9)
    @pokemons = @pokedex9.pokemon_entries
  end

  def pokemon6List
    @pokedex12 = PokeApi.get(pokedex: 12)
    @pokemons = @pokedex12.pokemon_entries
  end

  def pokemon7List
    @pokedex21 = PokeApi.get(pokedex: 21)
    @pokemons = @pokedex21.pokemon_entries
  end

end