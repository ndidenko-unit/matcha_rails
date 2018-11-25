class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :username, :string
  end
end
