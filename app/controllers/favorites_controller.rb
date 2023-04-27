require 'poke-api-v2'

class FavoritesController < ApplicationController
  before_action :check_for_login
  
  def index
    @favorites = Favorite.all
  end

  def create
    favorite = Favorite.create favorite_params
    @current_user.favorites << favorite

    redirect_to pokemon_favorites_path
    # alternatively: redirect_to root_path
  end


  def destroy
    favourite = @current_user.favorites.find favorite_params
    favorite.destroy
    redirect_to pokemon_favorites_path
  end   


  def favoritePokemon
    @user_id = @current_user.id
    @favorite_pokemon = @pokemon
  end


  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :pokemon_id)
  end
    
end
