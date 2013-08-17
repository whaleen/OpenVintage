# Adding Vintage to Bottles
class AddVintage < ActiveRecord::Migration
  def change
    add_column :bottles, :vintage, :string
  end
end
