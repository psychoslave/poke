require "application_system_test_case"

class PokemonsTest < ApplicationSystemTestCase
  setup do
    @pokemon = pokemons(:one)
  end

  test "visiting the index" do
    visit pokemons_url
    assert_selector "h1", text: "Pokemons"
  end

  test "creating a Pokemon" do
    visit pokemons_url
    click_on "New Pokemon"

    check "Abilities is hidden" if @pokemon.abilities_is_hidden
    fill_in "Abilities names", with: @pokemon.abilities_names
    fill_in "Abilities slot", with: @pokemon.abilities_slot
    fill_in "Base experience", with: @pokemon.base_experience
    fill_in "Forms names", with: @pokemon.forms_names
    fill_in "Height", with: @pokemon.height
    check "Is default" if @pokemon.is_default
    fill_in "Name", with: @pokemon.name
    fill_in "Order", with: @pokemon.order
    fill_in "Pokeapi", with: @pokemon.pokeapi_id
    fill_in "Types", with: @pokemon.types_id
    fill_in "Weight", with: @pokemon.weight
    click_on "Create Pokemon"

    assert_text "Pokemon was successfully created"
    click_on "Back"
  end

  test "updating a Pokemon" do
    visit pokemons_url
    click_on "Edit", match: :first

    check "Abilities is hidden" if @pokemon.abilities_is_hidden
    fill_in "Abilities names", with: @pokemon.abilities_names
    fill_in "Abilities slot", with: @pokemon.abilities_slot
    fill_in "Base experience", with: @pokemon.base_experience
    fill_in "Forms names", with: @pokemon.forms_names
    fill_in "Height", with: @pokemon.height
    check "Is default" if @pokemon.is_default
    fill_in "Name", with: @pokemon.name
    fill_in "Order", with: @pokemon.order
    fill_in "Pokeapi", with: @pokemon.pokeapi_id
    fill_in "Types", with: @pokemon.types_id
    fill_in "Weight", with: @pokemon.weight
    click_on "Update Pokemon"

    assert_text "Pokemon was successfully updated"
    click_on "Back"
  end

  test "destroying a Pokemon" do
    visit pokemons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pokemon was successfully destroyed"
  end
end
