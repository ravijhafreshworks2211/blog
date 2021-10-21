class Comment < ApplicationRecord
  include Visible
  belongs_to :article
  
  has_many :mentions
  has_many :users, through: :mentions
end
