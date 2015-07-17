class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_title
      t.string :comment_body
      t.integer :user_id
      t.integer :post_id
      t.timestamps
      
    end
  end
end
