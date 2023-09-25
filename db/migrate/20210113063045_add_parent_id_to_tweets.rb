class AddParentIdToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :parent_id, :integer
  end
end
