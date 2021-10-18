class Pokemon < ApplicationRecord
  #belongs_to :types, optional: true
  has_and_belongs_to_many :types
end
