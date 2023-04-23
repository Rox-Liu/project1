class CreatePokedexes < ActiveRecord::Migration[5.2]
  def change
    create_table :pokedexes do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
