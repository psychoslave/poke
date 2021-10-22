class Type < ApplicationRecord
  has_and_belongs_to_many :pokemons

  has_and_belongs_to_many :double_damage_from,
            class_name: "Type",
            join_table: :double_damage_from,
            foreign_key: :subject_id,
            association_foreign_key: :object_id

  has_and_belongs_to_many :double_damage_to,
            class_name: "Type",
            join_table: :double_damage_to,
            foreign_key: :subject_id,
            association_foreign_key: :object_id

  has_and_belongs_to_many :half_damage_from,
            class_name: "Type",
            join_table: :half_damage_from,
            foreign_key: :subject_id,
            association_foreign_key: :object_id

  has_and_belongs_to_many :half_damage_to,
            class_name: "Type",
            join_table: :half_damage_to,
            foreign_key: :subject_id,
            association_foreign_key: :object_id

  has_and_belongs_to_many :no_damage_from,
            class_name: "Type",
            join_table: :no_damage_from,
            foreign_key: :subject_id,
            association_foreign_key: :object_id

  has_and_belongs_to_many :no_damage_to,
            class_name: "Type",
            join_table: :no_damage_to,
            foreign_key: :subject_id,
            association_foreign_key: :object_id

end
