class Tweet < ActiveRecord::Base

  self.per_page = 20

  belongs_to :user
  has_many :favorites
  has_many :retweets, foreign_key: "source_tweet_id"
  validates :tweet_text, presence: true, length: { maximum: 240 }

  counter_culture :user

  mount_uploader :media, MediaUploader

end
