class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.string   "description"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"

      t.timestamps
    end
    add_index :places, [:user_id, :created_at]
  end
end
