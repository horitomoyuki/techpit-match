require 'rails_helper'

RSpec.describe ChatMessage, type: :model do
  describe '#create' do
    before do
      @chat_message = FactoryBot.build(:chat_message)
    end

    it 'contentが存在していれば保存できること' do
      expect(@chat_message).to be_valid
    end
    it 'contentが空でも保存できること' do
      @chat_message.content = ''
      expect(@chat_message).to be_valid
    end
    it 'contentが空では保存できないこと' do
      @chat_message.content = ''
      @chat_message.valid?
      expect(@chat_message.errors.full_messages).to include("Content can't be blank")
    end
    it 'chat_roomが紐付いていないと保存できないこと' do
      @chat_message.chat_room = nil
      @chat_message.valid?
      expect(@chat_message.errors.full_messages).to include("Room must exist")
    end
    it 'userが紐付いていないと保存できないこと' do
      @chat_message.user = nil
      @chat_message.valid?
      expect(@chat_message.errors.full_messages).to include("User must exist")
    end
  end
end
