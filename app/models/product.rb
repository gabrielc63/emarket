# t.string "name"
# t.text "description"
# t.integer "price"
# t.integer "category_id", null: false
# t.boolean "active"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["category_id"], name: "index_products_on_category_id"

class Product < ApplicationRecord
  belongs_to :category
end
