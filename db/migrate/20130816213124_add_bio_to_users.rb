# Add Bio to Users
class AddBio < ActiveRecord::Migration
  def change
    add_column :users, :bio, :string
  end
end
