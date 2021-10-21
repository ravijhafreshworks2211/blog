class CreateCommentsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :comments_users, id:false  do |t|
      t.integer :comment_id
      t.integer :user_id
      t.timestamps
    end
    add_index :comments_users, :comment_id
    add_index :comments_users, :user_id
  end
end
