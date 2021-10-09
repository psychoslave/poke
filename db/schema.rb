# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_09_140139) do

  create_table "pokemons", force: :cascade do |t|
    t.integer "base_experience"
    t.string "forms_names"
    t.integer "height"
    t.integer "pokeapi_id"
    t.boolean "is_default"
    t.string "name"
    t.integer "order"
    t.integer "types_id", null: false
    t.integer "weight"
    t.boolean "abilities_is_hidden"
    t.integer "abilities_slot"
    t.string "abilities_names"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["types_id"], name: "index_pokemons_on_types_id"
  end

  create_table "types", force: :cascade do |t|
    t.integer "pokeapi_id"
    t.string "name"
    t.string "generation_name"
    t.integer "double_damage_from_id", null: false
    t.integer "double_damage_to_id", null: false
    t.integer "half_damage_from_id", null: false
    t.integer "half_damage_to_id", null: false
    t.integer "no_damage_from_id", null: false
    t.integer "no_damage_to_id", null: false
    t.string "move_damage_class_name"
    t.string "moves_names"
    t.integer "pokemon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["double_damage_from_id"], name: "index_types_on_double_damage_from_id"
    t.index ["double_damage_to_id"], name: "index_types_on_double_damage_to_id"
    t.index ["half_damage_from_id"], name: "index_types_on_half_damage_from_id"
    t.index ["half_damage_to_id"], name: "index_types_on_half_damage_to_id"
    t.index ["no_damage_from_id"], name: "index_types_on_no_damage_from_id"
    t.index ["no_damage_to_id"], name: "index_types_on_no_damage_to_id"
    t.index ["pokemon_id"], name: "index_types_on_pokemon_id"
  end

  add_foreign_key "pokemons", "types", column: "types_id"
  add_foreign_key "types", "double_damage_froms"
  add_foreign_key "types", "double_damage_tos"
  add_foreign_key "types", "half_damage_froms"
  add_foreign_key "types", "half_damage_tos"
  add_foreign_key "types", "no_damage_froms"
  add_foreign_key "types", "no_damage_tos"
  add_foreign_key "types", "pokemons"
end
