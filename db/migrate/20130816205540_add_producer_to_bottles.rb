# Add Producer to Bottles
class AddProducer < ActiveRecord::Migration
  def change
    add_column :bottles, :producer, :string
  end
end
