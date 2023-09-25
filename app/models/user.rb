# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string           default(""), not null
#  username               :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  about                  :string
#  location               :string
#  website                :string
#  avatar                 :string
#  cover                  :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  slug                   :string
#  tweets_count           :integer          default(0), not null
#  followers_count        :integer          default(0), not null
#  following_count        :integer          default(0), not null
#
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessor :login

  self.per_page = 20

  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { maximum: 100 }
  validates :username, presence: true, length: { maximum: 20 }, :uniqueness => { case_sensitive: false }

  has_many :tweets
  has_many :relationships
  has_many :friends, through: :relationships
  has_many :inverse_relationships, class_name: "Relationship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_relationships, source: :user
  has_many :favorites
  has_many :retweets, foreign_key: "retweeter_id"

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
