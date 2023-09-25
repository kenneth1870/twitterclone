FactoryBot.define do
  factory :favorite do
    association :user
    association :tweet, factory: :tweet
  end
end
