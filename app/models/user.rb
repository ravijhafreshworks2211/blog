class User < ApplicationRecord
  has_secure_password

  has_many :mentions
  has_many :comments, through: :mentions

  validates :email, presence:true, uniqueness:true
end
