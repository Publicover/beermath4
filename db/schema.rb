
ActiveRecord::Schema.define(version: 20160628220035) do

  create_table "beers", force: :cascade do |t|
    t.string   "name"
    t.string   "brewer"
    t.integer  "price"
    t.integer  "ounce"
    t.integer  "calorie"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "reviewer"
    t.text     "body"
    t.integer  "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["beer_id"], name: "index_reviews_on_beer_id"

end
