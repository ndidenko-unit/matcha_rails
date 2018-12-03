class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :blocked_by_user_id, default: 0

      t.timestamps
    end
    add_index :friendships, [:user_id, :friend_id], unique: true
  end
end
