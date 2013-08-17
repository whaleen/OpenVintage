# Add Title to Bottles
class AddTitle < ActiveRecord::Migration
  def change
    add_column :bottles, :title, :string
  end
end
