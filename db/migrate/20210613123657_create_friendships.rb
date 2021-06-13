class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.references :member, index: true, foreign_key: true
      t.references :friend, index: true

      t.timestamps
    end
    add_foreign_key :friendships, :members, column: :friend_id
  end
end
