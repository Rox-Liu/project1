require 'poke-api-v2'

class PokemonController < ApplicationController
  def show
    @is_favorite = false;

    pokemon_id = params[:id]
    pokemonMaxId = 1010
    @pokemon = PokeApi.get(pokemon: pokemon_id)
    @pokemon_prev = nil
    @pokemon_next = nil
    
    
    evolution_chain_id = PokeApi.get(pokemon_species: pokemon_id).evolution_chain.url.split('/')[-1]
    @evolution_chain = PokeApi.get(evolution_chain: evolution_chain_id)
    
    if @current_user.present?
      fav_entry = Favorite.where(:user_id => @current_user.id, :pokemon_id => pokemon_id).any?
    end

    if fav_entry
      @is_favorite = true;
    end

    if pokemon_id.to_i > 1
      @pokemon_prev = PokeApi.get(pokemon: pokemon_id.to_i - 1)
    end

    if pokemon_id.to_i < pokemonMaxId
      @pokemon_next = PokeApi.get(pokemon: pokemon_id.to_i + 1)
    end

    render :viewPokemon
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