# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160507185522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigned_problems", force: :cascade do |t|
    t.integer  "problem_id"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.boolean  "is_assigned", default: true
    t.boolean  "is_solved",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "problem_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "problem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problem_topics", force: :cascade do |t|
    t.integer  "topic_id"
    t.integer  "problem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problems", force: :cascade do |t|
    t.text     "body"
    t.text     "answer"
    t.boolean  "is_proprietary", default: false
    t.boolean  "is_uploaded",    default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "equation"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "syllabuses", force: :cascade do |t|
    t.string   "course_name"
    t.integer  "teacher_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "up_load_file_name"
    t.string   "up_load_content_type"
    t.integer  "up_load_file_size"
    t.datetime "up_load_updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "school_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.integer  "syllabus_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
