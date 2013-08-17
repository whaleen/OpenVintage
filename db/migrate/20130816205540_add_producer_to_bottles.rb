class AddProducerToBottles < ActiveRecord::Migration
  def change
    add_column :bottles, :producer, :string
  end
end
