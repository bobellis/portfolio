class CreateRecommendation < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
