class AddFollowerToUsers < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :relationships, :users, column: :follower_id
    add_foreign_key :relationships, :users, column: :following_id
    add_index :relationships, [:follower_id, :following_id], unique: true
  end
end
