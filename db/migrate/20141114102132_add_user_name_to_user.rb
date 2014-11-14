# Migration to add username field to
# Users table
class AddUserNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
  end
end
