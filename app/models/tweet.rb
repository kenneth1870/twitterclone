# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  tweet_text :string(240)
#  location   :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#  media      :string
#
class Tweet < ActiveRecord::Base

  self.per_page = 10

  belongs_to :user
  has_many :favorites
  has_many :retweets, foreign_key: "source_tweet_id"
  validates :tweet_text, presence: true, length: { maximum: 240 }

  counter_culture :user

  mount_uploader :media, MediaUploader

end
