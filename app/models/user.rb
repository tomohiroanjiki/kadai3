class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :books, dependent: :destroy
  attachment :image
  validates :name, uniqueness: true
  validates :name, length: { maximum: 20 }
  validates :name, length: { minimum: 2 }
  validates :introduction, length: { maximum: 50 }
  
end
