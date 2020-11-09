
ActiveRecord::Schema.define(version: 2020_11_02_163522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "bonds", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "friend_id", null: false
    t.string "state", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "friend_id"], name: "index_bonds_on_user_id_and_friend_id", unique: true
  end

  create_table "pictures", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.string "caption"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "locale", null: false
    t.geography "coordinate", limit: {:srid=>4326, :type=>"st_point", :has_z=>true, :geographic=>true}, null: false
    t.string "name", null: false
    t.string "place_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coordinate"], name: "index_places_on_coordinate", using: :gist
    t.index ["locale", "coordinate"], name: "index_places_on_locale_and_coordinate", unique: true
    t.index ["locale"], name: "index_places_on_locale"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "thread_id"
    t.string "postable_type", null: false
    t.bigint "postable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["postable_type", "postable_id"], name: "index_posts_on_postable_type_and_postable_id"
  end

  create_table "signts", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.string "activity_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_signts_on_place_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "first_name", null: false
    t.string "last_name"
    t.string "email", null: false
    t.boolean "is_public", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "bonds", "users"
  add_foreign_key "bonds", "users", column: "friend_id"
  add_foreign_key "pictures", "posts"
  add_foreign_key "posts", "posts", column: "thread_id"
  add_foreign_key "posts", "users"
  add_foreign_key "signts", "places"
end
