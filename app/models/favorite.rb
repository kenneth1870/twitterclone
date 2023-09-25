# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  tweet_id   :bigint
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Favorite < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user
end
