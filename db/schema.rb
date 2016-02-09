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

ActiveRecord::Schema.define(version: 20160209044915) do

  create_table "answers", force: :cascade do |t|
    t.string   "answer"
    t.integer  "votes",       default: 0
    t.float    "vote_ratio",  default: 0.0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "question_id"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "votes",      default: 0
  end

  create_table "survey_answers", force: :cascade do |t|
    t.integer  "vote_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.integer  "answer_id"
  end

  add_index "survey_answers", ["answer_id"], name: "index_survey_answers_on_answer_id"
  add_index "survey_answers", ["question_id"], name: "index_survey_answers_on_question_id"

  create_table "visitors", force: :cascade do |t|
    t.string   "age"
    t.string   "gender"
    t.string   "email"
    t.integer  "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
