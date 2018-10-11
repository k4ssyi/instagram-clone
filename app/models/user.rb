class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :img_name, ImgNameUploader
  enum sex: { 男: 0, 女: 1 }

  #仮実装
  def feed
    Micropost.where("user_id = ?", id)
  end

end
