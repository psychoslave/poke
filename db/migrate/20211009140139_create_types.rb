class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.integer :pokeapi_id
      t.string :name
      t.string :generation_name
      t.references :double_damage_from, null: false, foreign_key:  { to_table: :types }
      t.references :double_damage_to, null: false, foreign_key:  { to_table: :types }
      t.references :half_damage_from, null: false, foreign_key:  { to_table: :types }
      t.references :half_damage_to, null: false, foreign_key:  { to_table: :types }
      t.references :no_damage_from, null: false, foreign_key:  { to_table: :types }
      t.references :no_damage_to, null: false, foreign_key:  { to_table: :types }
      t.string :move_damage_class_name
      t.string :moves_names
      #t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end

    create_join_table :pokemons, :types do |t|
      t.index :pokemon_id
      t.index :type_id
    end
  end
end