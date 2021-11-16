class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  
  has_many :followeds, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followers, foreign_key: :followed_id, class_name: 'Follow'
  
  has_many :articles
end
