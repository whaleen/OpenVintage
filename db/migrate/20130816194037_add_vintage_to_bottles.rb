class AddVintageToBottles < ActiveRecord::Migration
  def change
    add_column :bottles, :vintage, :string
  end
end
