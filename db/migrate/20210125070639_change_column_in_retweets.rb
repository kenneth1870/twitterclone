class ChangeColumnInRetweets < ActiveRecord::Migration[6.0]
  def change
    rename_column :retweets, :retweet_id, :source_tweet_id
  end
end
