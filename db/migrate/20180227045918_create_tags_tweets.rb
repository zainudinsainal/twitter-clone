class CreateTagsTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tags_tweets do |t|
      t.references :tag, foreign_key: true
      t.references :tweet, foreign_key: true
      t.timestamps
    end
    add_index :tags_tweets, [:tag_id, :tweet_id], unique: true
  end
end
