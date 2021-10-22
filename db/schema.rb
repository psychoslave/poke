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

  create_table "double_damage_from", id: false, force: :cascade do |t|
    t.integer "subject_id"
    t.integer "object_id"
    t.index ["object_id", "subject_id"], name: "index_double_damage_from_on_object_id_and_subject_id", unique: true
    t.index ["subject_id", "object_id"], name: "index_double_damage_from_on_subject_id_and_object_id", unique: true
  end

  create_table "double_damage_to", id: false, force: :cascade do |t|
    t.integer "subject_id"
    t.integer "object_id"
    t.index ["object_id", "subject_id"], name: "index_double_damage_to_on_object_id_and_subject_id", unique: true
    t.index ["subject_id", "object_id"], name: "index_double_damage_to_on_subject_id_and_object_id", unique: true
  end

  create_table "half_damage_from", id: false, force: :cascade do |t|
    t.integer "subject_id"
    t.integer "object_id"
    t.index ["object_id", "subject_id"], name: "index_half_damage_from_on_object_id_and_subject_id", unique: true
    t.index ["subject_id", "object_id"], name: "index_half_damage_from_on_subject_id_and_object_id", unique: true
  end

  create_table "half_damage_to", id: false, force: :cascade do |t|
    t.integer "subject_id"
    t.integer "object_id"
    t.index ["object_id", "subject_id"], name: "index_half_damage_to_on_object_id_and_subject_id", unique: true
    t.index ["subject_id", "object_id"], name: "index_half_damage_to_on_subject_id_and_object_id", unique: true
  end

  create_table "no_damage_from", id: false, force: :cascade do |t|
    t.integer "subject_id"
    t.integer "object_id"
    t.index ["object_id", "subject_id"], name: "index_no_damage_from_on_object_id_and_subject_id", unique: true
    t.index ["subject_id", "object_id"], name: "index_no_damage_from_on_subject_id_and_object_id", unique: true
  end

  create_table "no_damage_to", id: false, force: :cascade do |t|
    t.integer "subject_id"
    t.integer "object_id"
    t.index ["object_id", "subject_id"], name: "index_no_damage_to_on_object_id_and_subject_id", unique: true
    t.index ["subject_id", "object_id"], name: "index_no_damage_to_on_subject_id_and_object_id", unique: true
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "base_experience"
    t.string "forms_names"
    t.integer "height"
    t.integer "pokeapi_id"
    t.boolean "is_default"
    t.string "name"
    t.integer "order"
    t.integer "weight"
    t.boolean "abilities_is_hidden"
    t.integer "abilities_slot"
    t.string "abilities_names"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons_types", id: false, force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "type_id", null: false
    t.index ["pokemon_id"], name: "index_pokemons_types_on_pokemon_id"
    t.index ["type_id"], name: "index_pokemons_types_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.integer "pokeapi_id"
    t.string "name"
    t.string "generation_name"
    t.string "move_damage_class_name"
    t.string "moves_names"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
