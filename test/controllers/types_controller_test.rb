require "test_helper"

class TypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type = types(:one)
  end

  test "should get index" do
    get types_url
    assert_response :success
  end

  test "should get new" do
    get new_type_url
    assert_response :success
  end

  test "should create type" do
    assert_difference('Type.count') do
      post types_url, params: { type: { double_damage_from: @type.double_damage_from, double_damage_to: @type.double_damage_to, generation_name: @type.generation_name, half_damage_from: @type.half_damage_from, half_damage_to: @type.half_damage_to, move_damage_class_name: @type.move_damage_class_name, moves_names: @type.moves_names, name: @type.name, no_damage_from: @type.no_damage_from, no_damage_to: @type.no_damage_to, pokeapi_id: @type.pokeapi_id, pokemons: @type.pokemons } }
    end

    assert_redirected_to type_url(Type.last)
  end

  test "should show type" do
    get type_url(@type)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_url(@type)
    assert_response :success
  end

  test "should update type" do
    patch type_url(@type), params: { type: { double_damage_from: @type.double_damage_from, double_damage_to: @type.double_damage_to, generation_name: @type.generation_name, half_damage_from: @type.half_damage_from, half_damage_to: @type.half_damage_to, move_damage_class_name: @type.move_damage_class_name, moves_names: @type.moves_names, name: @type.name, no_damage_from: @type.no_damage_from, no_damage_to: @type.no_damage_to, pokeapi_id: @type.pokeapi_id, pokemons: @type.pokemons } }
    assert_redirected_to type_url(@type)
  end

  test "should destroy type" do
    assert_difference('Type.count', -1) do
      delete type_url(@type)
    end

    assert_redirected_to types_url
  end
end
