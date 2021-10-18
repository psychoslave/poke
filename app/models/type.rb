class Type < ApplicationRecord
  has_many :double_damage_from_items, class_name: "Type", foreign_key: "double_damage_from_id"
  has_many :double_damage_to_items, class_name: "Type", foreign_key: "double_damage_to_id"
  has_many :half_damage_from_items, class_name: "Type", foreign_key: "half_damage_from_id"
  has_many :half_damage_to_items, class_name: "Type", foreign_key: "half_damage_to_id"
  has_many :no_damage_from_items, class_name: "Type", foreign_key: "no_damage_from_id"
  has_many :no_damage_to_items, class_name: "Type", foreign_key: "no_damage_to_id"
  has_and_belongs_to_many :pokemons
  #belongs_to :pokemon
end
