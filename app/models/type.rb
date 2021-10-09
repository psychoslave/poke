class Type < ApplicationRecord
  belongs_to :double_damage_from
  belongs_to :double_damage_to
  belongs_to :half_damage_from
  belongs_to :half_damage_to
  belongs_to :no_damage_from
  belongs_to :no_damage_to
  belongs_to :pokemon
end
