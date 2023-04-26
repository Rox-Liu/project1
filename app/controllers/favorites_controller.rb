require 'poke-api-v2'

class FavoritesController < ApplicationController

    def create
        @favourite = current_user.favourites.new(favourite_params)
        if @favourite.save
        redirect_to @favourite.pokemon, notice: "Added to favourites"
        else
        redirect_to @favourite.pokemon, alert: "Error adding to favourites"
        end
    end

    private

    def favourite_params
        params.require(:favourite).permit(:pokemon_id)
    end
    
    def destroy
        @favourite = current_user.favourites.find_by(pokemon_id: params[:id])
        if @favourite.destroy
          redirect_to favourites_path, notice: "Removed from favourites"
        else
          redirect_to favourites_path, alert: "Error removing from favourites"
        end
      end    
      
end
