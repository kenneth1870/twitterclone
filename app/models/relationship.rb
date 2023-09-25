# == Schema Information
#
# Table name: relationships
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"
  counter_culture :user, column_name: :following_count
  counter_culture :friend, column_name: :followers_count
end
