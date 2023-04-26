class Pokemon < ApplicationRecord
    has_many :favourites
    has_many :users, through: :favourites
  
    def favourited_by?(user)
      favourites.exists?(user_id: user.id)
    end
  end
  
