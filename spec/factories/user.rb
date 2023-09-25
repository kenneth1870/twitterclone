FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.unique.username }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    about { Faker::Lorem.sentence }
    location { Faker::Address.city }
    website { Faker::Internet.url }
    avatar { Faker::Avatar.image }
    cover { Faker::Placeholdit.image }
    confirmed_at { Time.current }
    reset_password_sent_at { Time.current }
    sign_in_count { 2 }
    current_sign_in_at { Time.current }
    current_sign_in_ip { Faker::Internet.ip_v4_address }
    last_sign_in_at { Time.current }
    last_sign_in_ip { Faker::Internet.ip_v4_address }
    confirmation_token { nil } # No need to set this manually
    confirmation_sent_at { nil } # No need to set this manually
    reset_password_token { nil } # No need to set this manually
    tweets_count { 2 }
    followers_count { 1 }
    following_count { 0 }
    slug { |user| "#{user.username.parameterize}-#{rand(1000)}" } # Unique slug
  end
end
