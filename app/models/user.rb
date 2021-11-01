class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :follower, source: :followed

  has_many :followed, class_name: 'Relationship', foreign_key:"followed_id", dependent: :destroy
  has_many :follower_users, through: :followed, source: :follower
  
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  attachment :profile_image

  validates :name, presence: true, uniqueness: true, length:{ minimum: 2, maximum: 20}
  validates :introduction, length:{maximum: 50}

end
