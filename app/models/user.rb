class User < ApplicationRecord
  has_many :reactions
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users
  has_many :chat_messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :name, :gender
  end

  enum gender: { man: 0, woman: 1 }
  validates :self_introduction, length: { maximum: 500 }

  mount_uploader :profile_image, ProfileImageUploader
  has_one_attached :image

  def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.gender = 1
      user.self_introduction = '僕を好きになってください'
      user.image.attach(io: File.open("#{Rails.root}/db/dummy_images/man.jpg"), filename: "man.jpg")
    end
  end

end
