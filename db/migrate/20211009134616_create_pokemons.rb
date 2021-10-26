class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.integer :base_experience
      t.string :forms_names
      t.integer :height
      t.integer :pokeapi_id
      t.boolean :is_default
      t.string :name
      t.integer :order
      t.integer :weight
      t.boolean :abilities_is_hidden
      t.integer :abilities_slot
      t.string :abilities_names

      t.timestamps
    end
  end
end
