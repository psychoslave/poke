require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon = pokemons(:one)
  end

  test "should get index" do
    get pokemons_url, as: :json
    assert_response :success
    result = response.parsed_body
    sample = result.first
    assert_equal result.count, Pokemon.count
    assert_equal sample.keys, %w[id name types]
  end

  test "should get new" do
    get new_pokemon_url
    assert_response :success
  end

  test "should create pokemon" do
    assert_difference('Pokemon.count') do
      post pokemons_url, params: { pokemon: { abilities_is_hidden: @pokemon.abilities_is_hidden, abilities_names: @pokemon.abilities_names, abilities_slot: @pokemon.abilities_slot, base_experience: @pokemon.base_experience, forms_names: @pokemon.forms_names, height: @pokemon.height, is_default: @pokemon.is_default, name: @pokemon.name, order: @pokemon.order, pokeapi_id: @pokemon.pokeapi_id, types: @pokemon.types, weight: @pokemon.weight } }
    end

    assert_redirected_to pokemon_url(Pokemon.last)
  end

  test "should show pokemon" do
    get pokemon_url(@pokemon), as: :json
    assert_response :success

    # result should contains all attributes of a pokemon, but nothing else
    result = response.parsed_body
    assert_equal result.keys - Pokemon.first.attribute_names, %w[types]
    assert 'types'.in?(result.keys)
  end

  test "should get edit" do
    get edit_pokemon_url(@pokemon)
    assert_response :success
  end

  test "should update pokemon" do
    patch pokemon_url(@pokemon), params: { pokemon: { abilities_is_hidden: @pokemon.abilities_is_hidden, abilities_names: @pokemon.abilities_names, abilities_slot: @pokemon.abilities_slot, base_experience: @pokemon.base_experience, forms_names: @pokemon.forms_names, height: @pokemon.height, is_default: @pokemon.is_default, name: @pokemon.name, order: @pokemon.order, pokeapi_id: @pokemon.pokeapi_id, types: @pokemon.types, weight: @pokemon.weight } }
    assert_redirected_to pokemon_url(@pokemon)
  end

  test "should destroy pokemon" do
    assert_difference('Pokemon.count', -1) do
      delete pokemon_url(@pokemon)
    end

    assert_redirected_to pokemons_url
  end
end
