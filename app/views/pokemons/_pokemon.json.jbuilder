json.extract! pokemon, :id, :base_experience, :forms_names, :height, :pokeapi_id, :is_default, :name, :order, :types_id, :weight, :abilities_is_hidden, :abilities_slot, :abilities_names, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
