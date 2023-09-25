class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :tweet_text, limit: 240
      t.string :location
      t.references :user, index: true

      t.timestamps
    end
  end
end
