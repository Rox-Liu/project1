class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :pokemon_id
      # This would prevent the DB from storing multiple entries 
      # with duplicate data from multiple DB connections
      # t.index [:user_id, :pokemon_id], unique: true
      t.timestamps
    end
  end
end
