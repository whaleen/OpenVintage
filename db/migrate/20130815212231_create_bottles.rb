class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.string :title
      t.string   "content"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"

      t.timestamps
    end
    add_index :bottles, [:user_id, :created_at]
  end
end
