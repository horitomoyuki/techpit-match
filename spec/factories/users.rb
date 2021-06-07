FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    gender {0}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}

    # after(:build) do |user|
    #   user.profile_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end
  end
end