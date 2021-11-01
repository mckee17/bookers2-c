class Group < ApplicationRecord
  has_many :group_users
  has_many :users_group, through: :group_id, source: :users
  
  attachment :image
end
