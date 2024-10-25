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
  has_many :stocks

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
    attachable.variant :medium, resize_to_limit: [250, 250]
  end
end
