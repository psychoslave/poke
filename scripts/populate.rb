#!/bin/env bin/rails runner


# For each Pokemon, create an entry without foreign keys
# Pokemon.new.attributes.keys
# b = PokeApi.get(pokemon: 'bulbasaur')

=begin
puts 'Dropping all existing pokemon entries'
Pokemon.delete_all
puts <<~TIP.strip
  Importing all pokemons.
  This might take a while, but you should expect less than 5 minutes.
TIP
Pokemon_count = PokeApi.get(:pokemon).count
# Note: itering over PokeApi.get(pokemon: {limit: Pokemon_count}) would ask for
# less API call, but results lake some inforamtion like forms, so we would end
# up requiring individuel item anyway, unless some option exits to fetch all in
# one.
PokeApi.get(pokemon: {limit: Pokemon_count}).results.each do |wad|
  # Results of this query only hold a name and an URL. Here the identfier is
  # extracted from the later, ending in /123/ for pokemon with identifier 123.
  #
  # Note that PokeApi identifiers are *not* a continuous series, and passing
  # through this extraction allow to call non-existing entries and stay align
  # with the remote identifier set.
  bib = wad.url.match(/(\d+)\/$/)[1]
  ens = PokeApi.get(pokemon: bib)
  pokemon = Pokemon.create(
    id: ens.id,
    base_experience: ens.base_experience,
    forms_names: ens.forms.map{|ens| ens.name}.join(','),
    height: ens.height,
    pokeapi_id: ens.id,
    is_default: ens.is_default,
    name: ens.name,
    order: ens.order,
    #types_id: ens.types_id,
    weight: ens.weight,
    # Note: this is a rather clumsy way to implement this attribute falttening,
    # but we will stick with that for now
    abilities_is_hidden: ens.abilities.map{|ens| ens.is_hidden}.join(','),
    abilities_slot: ens.abilities.map{|ens| ens.slot}.join(','),
    abilities_names: ens.abilities.map{|ens| ens.ability.name}.join(','),
  )
  if !pokemon.save
    $stderr.puts "Something went wrong for creation of #{ens.name} (#{ens.id}):"\
      "#{pokemon.errors.full_messages}"
  end
end
puts 'Pokemons were imported!'

=end
#=begin

# For each Type, create an entry without foreign keys
puts 'Dropping all existing type entries'
Type.delete_all
puts 'Importing types entries from PokeApi'
Type_count = PokeApi.get(:type).count
PokeApi.get(type: {limit: Type_count}).results.each do |wad|
  bib = wad.url.match(/(\d+)\/$/)[1]
  ens = PokeApi.get(type: bib)
  type = Type.create(
    id: ens.id,
    pokeapi_id: ens.id,
    name: ens.name,
    generation_name: ens.generation.name,
    move_damage_class_name: ens&.move_damage_class&.name,
    moves_names: ens.instance_variable_get(:@moves).map{|ens| ens.name}.sort,
  )
  type.pokemons = Pokemon.where(id: ens.pokemon.map{|ens| ens.pokemon.url.match(/(\d+)\/$/)[1]} )
  if !type.save
    $stderr.puts "Something went wrong for adding pokemons to type #{ens.id}):"\
      "#{type.errors.full_messages}"
  end
end

PokeApi.get(type: {limit: Type_count}).results.each do |wad|
  bib = wad.url.match(/(\d+)\/$/)[1]
  ens = PokeApi.get(type: bib)
  type = Type.find(ens.id)
  type.double_damage_from = Type.where(id: ens.damage_relations.double_damage_from.map{|ens| ens.url.match(/(\d+)\/$/)[1]})
  type.double_damage_to = Type.where(id: ens.damage_relations.double_damage_to.map{|ens| ens.url.match(/(\d+)\/$/)[1]})
  type.half_damage_from = Type.where(id: ens.damage_relations.half_damage_from.map{|ens| ens.url.match(/(\d+)\/$/)[1]})
  type.half_damage_to = Type.where(id: ens.damage_relations.half_damage_to.map{|ens| ens.url.match(/(\d+)\/$/)[1]})
  type.no_damage_from = Type.where(id: ens.damage_relations.no_damage_from.map{|ens| ens.url.match(/(\d+)\/$/)[1]})
  type.no_damage_to = Type.where(id: ens.damage_relations.no_damage_to.map{|ens| ens.url.match(/(\d+)\/$/)[1]})
  if !type.save
    $stderr.puts "Something went wrong while adding damage relationships to type #{ens.id}):"\
      "#{type.errors.full_messages}"
  end
end

# Update each pokemon with relevant foreign keys from Type
# Update each type with relevant foreign keys from Pokemon and Type
