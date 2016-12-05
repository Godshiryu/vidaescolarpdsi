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

ActiveRecord::Schema.define(version: 20161204122231) do

  create_table "absences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "absences", ["lesson_id"], name: "index_absences_on_lesson_id"
  add_index "absences", ["user_id"], name: "index_absences_on_user_id"

  create_table "activities", force: :cascade do |t|
    t.string   "nome"
    t.integer  "Discipline_id"
    t.datetime "data"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "nome"
    t.integer  "School_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses", ["School_id"], name: "index_courses_on_School_id"

  create_table "discanexos", force: :cascade do |t|
    t.integer  "Discipline_id"
    t.string   "anexo_file_name"
    t.string   "anexo_content_type"
    t.integer  "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "discanexos", ["Discipline_id"], name: "index_discanexos_on_Discipline_id"

  create_table "disciplines", force: :cascade do |t|
    t.string   "nome"
    t.integer  "cargahoraria"
    t.integer  "Course_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "users_id"
    t.string   "anexo_file_name"
    t.string   "anexo_content_type"
    t.integer  "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.string   "senha"
    t.string   "codigo"
  end

  add_index "disciplines", ["Course_id"], name: "index_disciplines_on_Course_id"

  create_table "discusers", force: :cascade do |t|
    t.integer  "User_id"
    t.integer  "Discipline_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "discusers", ["Discipline_id"], name: "index_discusers_on_Discipline_id"
  add_index "discusers", ["User_id"], name: "index_discusers_on_User_id"

  create_table "faqs", force: :cascade do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.float    "nota"
    t.integer  "Activity_id"
    t.integer  "User_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "grades", ["User_id"], name: "index_grades_on_User_id"

  create_table "lessons", force: :cascade do |t|
    t.string   "tema"
    t.datetime "datahora"
    t.string   "sala"
    t.integer  "Discipline_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "anexo_file_name"
    t.string   "anexo_content_type"
    t.integer  "anexo_file_size"
    t.datetime "anexo_updated_at"
  end

  add_index "lessons", ["Discipline_id"], name: "index_lessons_on_Discipline_id"

  create_table "progress_questions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "resposta"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "progress_questions", ["question_id"], name: "index_progress_questions_on_question_id"
  add_index "progress_questions", ["user_id"], name: "index_progress_questions_on_user_id"

  create_table "progress_themes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "theme_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "progress_themes", ["theme_id"], name: "index_progress_themes_on_theme_id"
  add_index "progress_themes", ["user_id"], name: "index_progress_themes_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "theme_id"
    t.text     "pergunta"
    t.string   "resposta"
    t.text     "alternativaA"
    t.text     "alternativaB"
    t.text     "alternativaC"
    t.text     "alternativaD"
    t.text     "alternativaE"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "questions", ["theme_id"], name: "index_questions_on_theme_id"

  create_table "rapidfire_answer_groups", force: :cascade do |t|
    t.integer  "question_group_id"
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rapidfire_answer_groups", ["question_group_id"], name: "index_rapidfire_answer_groups_on_question_group_id"
  add_index "rapidfire_answer_groups", ["user_id", "user_type"], name: "index_rapidfire_answer_groups_on_user_id_and_user_type"

  create_table "rapidfire_answers", force: :cascade do |t|
    t.integer  "answer_group_id"
    t.integer  "question_id"
    t.text     "answer_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rapidfire_answers", ["answer_group_id"], name: "index_rapidfire_answers_on_answer_group_id"
  add_index "rapidfire_answers", ["question_id"], name: "index_rapidfire_answers_on_question_id"

  create_table "rapidfire_question_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rapidfire_questions", force: :cascade do |t|
    t.integer  "question_group_id"
    t.string   "type"
    t.string   "question_text"
    t.integer  "position"
    t.text     "answer_options"
    t.text     "validation_rules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rapidfire_questions", ["question_group_id"], name: "index_rapidfire_questions_on_question_group_id"

  create_table "schools", force: :cascade do |t|
    t.string   "nome"
    t.string   "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string   "nome"
    t.integer  "discipline_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "themes", ["discipline_id"], name: "index_themes_on_discipline_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "nome"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
