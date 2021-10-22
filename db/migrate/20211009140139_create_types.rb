class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.integer :pokeapi_id
      t.string :name
      t.string :generation_name
      t.string :move_damage_class_name
      t.string :moves_names

      t.timestamps
    end

    damage_relationships = %i{double_damage_from double_damage_to
                              half_damage_from half_damage_to
                              no_damage_from no_damage_to}

    damage_relationships.each do |damage_relationship|
      create_table damage_relationship, id: false do |t|
        t.integer :subject_id
        t.integer :object_id
      end

      add_index(damage_relationship, [:subject_id, :object_id], unique: true)
      add_index(damage_relationship, [:object_id, :subject_id], unique: true)
   end

    create_join_table :pokemons, :types do |t|
      t.index :pokemon_id
      t.index :type_id
    end
  end
end
