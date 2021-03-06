class AddCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tweets_count, :integer, null: false, default: 0
    add_column :users, :followers_count, :integer, null: false, default: 0
    add_column :users, :following_count, :integer, null: false, default: 0
  end
end
