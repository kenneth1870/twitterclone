# == Schema Information
#
# Table name: retweets
#
#  id              :bigint           not null, primary key
#  retweeter_id    :integer
#  source_tweet_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Retweet < ActiveRecord::Base
  belongs_to :retweeter, class_name: "User"
  belongs_to :source_tweet, class_name: "Tweet"

  validates_presence_of :retweeter

end
