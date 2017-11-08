# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171108045817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "columns", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_columns_on_project_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "task_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_comments_on_participant_id"
    t.index ["task_id"], name: "index_comments_on_task_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.string "active_cookie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_participants_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "account_id"
    t.string "name"
    t.string "secret_word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_projects_on_account_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "column_id"
    t.string "state"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_tasks_on_column_id"
    t.index ["participant_id"], name: "index_tasks_on_participant_id"
  end

  add_foreign_key "comments", "participants"
  add_foreign_key "comments", "tasks"
  add_foreign_key "participants", "projects"
  add_foreign_key "projects", "accounts"
  add_foreign_key "tasks", "columns"
  add_foreign_key "tasks", "participants"
end
