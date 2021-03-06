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

ActiveRecord::Schema.define(version: 20150205145649) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  add_index "admin_users", ["username"], name: "index_admin_users_on_username", unique: true, using: :btree

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "era"
    t.boolean  "pinned"
    t.integer  "category"
  end

  add_index "articles", ["category", "pinned", "era"], name: "index_articles_on_category_and_pinned_and_era", using: :btree

  create_table "attachments", force: true do |t|
    t.integer  "article_id"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["article_id"], name: "index_attachments_on_article_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contest_problem_joints", force: true do |t|
    t.integer  "contest_id"
    t.integer  "problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contest_problem_joints", ["contest_id", "problem_id"], name: "contest_task_ix", unique: true, using: :btree

  create_table "contests", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "contest_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contests", ["start_time", "end_time"], name: "index_contests_on_start_time_and_end_time", using: :btree

  create_table "judge_servers", force: true do |t|
    t.string   "name"
    t.string   "ip"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "limits", force: true do |t|
    t.integer  "time",         default: 1000
    t.integer  "memory",       default: 65536
    t.integer  "output",       default: 65536
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "testdatum_id"
  end

  add_index "limits", ["testdatum_id"], name: "index_limits_on_testdatum_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["updated_at"], name: "index_posts_on_updated_at", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "problems", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "input"
    t.text     "output"
    t.text     "example_input"
    t.text     "example_output"
    t.text     "hint"
    t.integer  "visible_state",                   default: 0
    t.integer  "problem_type"
    t.text     "sjcode",         limit: 16777215
    t.text     "interlib",       limit: 16777215
    t.integer  "old_pid"
  end

  add_index "problems", ["name"], name: "index_problems_on_name", using: :btree

  create_table "submissions", force: true do |t|
    t.text     "code",         limit: 16777215
    t.string   "compiler",                      default: ""
    t.string   "result",                        default: "queued"
    t.integer  "score",                         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "problem_id",                    default: 0
    t.integer  "user_id",                       default: 0
    t.integer  "contest_id"
    t.text     "_result"
    t.integer  "total_time"
    t.integer  "total_memory"
  end

  add_index "submissions", ["compiler"], name: "index_submissions_on_compiler", using: :btree
  add_index "submissions", ["contest_id"], name: "index_submissions_on_contest_id", using: :btree
  add_index "submissions", ["problem_id"], name: "index_submissions_on_problem_id", using: :btree
  add_index "submissions", ["result"], name: "index_submissions_on_result", using: :btree
  add_index "submissions", ["total_time", "total_memory"], name: "submissions_sort_ix", using: :btree
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "testdata", force: true do |t|
    t.integer  "problem_id"
    t.string   "test_input"
    t.string   "test_output"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testdata_sets", force: true do |t|
    t.integer  "problem_id"
    t.integer  "from"
    t.integer  "to"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "testdata_sets", ["problem_id"], name: "index_testdata_sets_on_problem_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.string   "avatar"
    t.boolean  "admin",                  default: false
    t.string   "username"
    t.string   "motto"
    t.string   "school"
    t.integer  "gradyear"
    t.string   "name"
    t.datetime "last_submit_time"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
