class Favorite < ApplicationRecord
    belongs_to :user, :optional => true
    belongs_to :pokemon, :optional => true
    validates :user, uniqueness: {scope: [:pokemon_id]}
end
