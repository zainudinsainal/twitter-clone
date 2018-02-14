class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.text :post, null: false
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
