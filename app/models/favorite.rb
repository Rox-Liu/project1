class Favorite < ApplicationRecord
    belongs_to :user, :optional => true
    belongs_to :pokemon, :optional => true
end
  