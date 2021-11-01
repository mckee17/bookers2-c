class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  
  def group_by?(user)
      group_users.where(user_id: user.id).exists?
  end

  attachment :image
  
  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
end
