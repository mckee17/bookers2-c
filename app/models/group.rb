class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users

  attachment :image
  
  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
end
