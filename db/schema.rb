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

ActiveRecord::Schema.define(version: 2021_03_19_153909) do

  create_table "inventarios", force: :cascade do |t|
    t.integer "personaje_id"
    t.integer "objeto_id"
    t.integer "cantidad"
  end

  create_table "npcs", force: :cascade do |t|
    t.string "nombre"
    t.integer "hp_max"
    t.integer "hp_actual"
    t.integer "daño_min"
    t.integer "daño_max"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "evasion"
  end

  create_table "objetos", force: :cascade do |t|
    t.string "nombre"
    t.boolean "usable"
    t.boolean "equipable"
    t.integer "valor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "personajes", force: :cascade do |t|
    t.integer "nivel"
    t.integer "exp"
    t.string "nombre"
    t.string "clase"
    t.integer "mana_max"
    t.integer "mana_actual"
    t.integer "hp_max"
    t.integer "hp_actual"
    t.integer "daño_min"
    t.integer "daño_max"
    t.boolean "arma", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "usuario_id"
    t.decimal "evasion"
    t.integer "oro"
    t.integer "etapa_actual"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

end
