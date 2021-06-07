FactoryBot.define do
  factory :chat_room_user do
    association :user
    association :room
  end
end