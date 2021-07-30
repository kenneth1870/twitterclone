class AddMediaToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :media, :string
  end
end
