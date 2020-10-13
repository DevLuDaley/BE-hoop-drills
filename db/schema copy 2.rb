# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_13_130632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drills", force: :cascade do |t|
    t.string "drill_type"
    t.string "drill_name"
    t.integer "reps"
    t.integer "sets"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "routines", force: :cascade do |t|
    t.string "routine_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "routines_drills", force: :cascade do |t|
    t.bigint "routine_id", null: false
    t.bigint "drill_id", null: false
    t.index ["drill_id"], name: "index_routines_drills_on_drill_id"
    t.index ["routine_id"], name: "index_routines_drills_on_routine_id"
  end

  add_foreign_key "routines_drills", "drills"
  add_foreign_key "routines_drills", "routines"
end
