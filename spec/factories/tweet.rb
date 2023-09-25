FactoryBot.define do
  factory :tweet do
    location { Faker::Address.city }
    media { Faker::Placeholdit.image }
    parent_id { nil } # No need to set this manually
    tweet_text { Faker::Lorem.sentence }
    user { association :user } # Create a user association using another factory
  end
end
