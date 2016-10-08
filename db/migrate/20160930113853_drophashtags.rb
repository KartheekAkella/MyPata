class Drophashtags < ActiveRecord::Migration[5.0]
  def change
  	drop_table "hashtags", force: :cascade do |t|
    t.string   "hashtag"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hashtags_on_user_id"
  end
  end
end
