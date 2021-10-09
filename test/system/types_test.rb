require "application_system_test_case"

class TypesTest < ApplicationSystemTestCase
  setup do
    @type = types(:one)
  end

  test "visiting the index" do
    visit types_url
    assert_selector "h1", text: "Types"
  end

  test "creating a Type" do
    visit types_url
    click_on "New Type"

    fill_in "Double damage from", with: @type.double_damage_from_id
    fill_in "Double damage to", with: @type.double_damage_to_id
    fill_in "Generation name", with: @type.generation_name
    fill_in "Half damage from", with: @type.half_damage_from_id
    fill_in "Half damage to", with: @type.half_damage_to_id
    fill_in "Move damage class name", with: @type.move_damage_class_name
    fill_in "Moves names", with: @type.moves_names
    fill_in "Name", with: @type.name
    fill_in "No damage from", with: @type.no_damage_from_id
    fill_in "No damage to", with: @type.no_damage_to_id
    fill_in "Pokeapi", with: @type.pokeapi_id
    fill_in "Pokemon", with: @type.pokemon_id
    click_on "Create Type"

    assert_text "Type was successfully created"
    click_on "Back"
  end

  test "updating a Type" do
    visit types_url
    click_on "Edit", match: :first

    fill_in "Double damage from", with: @type.double_damage_from_id
    fill_in "Double damage to", with: @type.double_damage_to_id
    fill_in "Generation name", with: @type.generation_name
    fill_in "Half damage from", with: @type.half_damage_from_id
    fill_in "Half damage to", with: @type.half_damage_to_id
    fill_in "Move damage class name", with: @type.move_damage_class_name
    fill_in "Moves names", with: @type.moves_names
    fill_in "Name", with: @type.name
    fill_in "No damage from", with: @type.no_damage_from_id
    fill_in "No damage to", with: @type.no_damage_to_id
    fill_in "Pokeapi", with: @type.pokeapi_id
    fill_in "Pokemon", with: @type.pokemon_id
    click_on "Update Type"

    assert_text "Type was successfully updated"
    click_on "Back"
  end

  test "destroying a Type" do
    visit types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type was successfully destroyed"
  end
end
