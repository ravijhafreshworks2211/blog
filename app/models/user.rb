class User < ApplicationRecord
  has_secure_password

  has_many :mentions
  has_many :comments, through: :mentions

  validates :email, presence:true, uniqueness:true

  has_one_attached :user_image
  
  def self.cached_count 
    Rails.cache.fetch([self,"user_count"]){
      self.count
    }
  end


end
