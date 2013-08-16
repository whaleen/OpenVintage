class AddTitleToBottles < ActiveRecord::Migration
  def change
    add_column :bottles, :title, :string
  end
end
