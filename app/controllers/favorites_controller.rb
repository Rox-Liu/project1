require 'poke-api-v2'

class FavoritesController < ApplicationController
  before_action :check_for_login
  
  def index
    @favorites = Favorite.where(user_id: @current_user.id).where.not(pokemon_id: nil)
    @favorite_pokemon = []
    @favorites.each do |favorite|
      @favorite_pokemon << PokeApi.get(pokemon: favorite.pokemon_id)
    end
  end

  def create
    Favorite.create(user_id: @current_user.id, pokemon_id: params[:id])
    redirect_to favorites_path
  end

  def destroy
    favorite = Favorite.where(pokemon_id: params[:id], user_id: @current_user.id).take
    favorite.destroy 
    redirect_to favorites_path
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :pokemon_id, :favorite_params)
  end
    
end