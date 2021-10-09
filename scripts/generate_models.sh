
##################################################
# Pokemon model
# No URL is included
# Flattenned abilities
# Flattened arrays are comma separated list concatenation of each matching name
rails generate scaffold Pokemon \
  base_experience:integer \
  forms_names:string \
  height:integer \
  pokeapi_id:integer \
  is_default:boolean \
  name:string \
  order:integer \
  types:references \
  weight:integer \
  abilities_is_hidden:boolean \
  abilities_slot:integer \
  abilities_names:string

##################################################
# Type model
# For various reason, it references other instances of the same model
rails generate scaffold Type \
  pokeapi_id:integer \
  name:string \
  double_damage_from:references \
  double_damage_to:references \
  half_damage_from:references \
  half_damage_to:references \
  no_damage_from:references \
  no_damage_to:references \
  generation_name:string \
  move_damage_class_name:string \
  moves_names:string \
  pokemon:references
