# Add Handle to Users
class AddHandle < ActiveRecord::Migration
  def change
    add_column :users, :handle, :string
  end
end
