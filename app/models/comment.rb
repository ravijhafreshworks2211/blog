class Comment < ApplicationRecord
  include Visible
  belongs_to :article,touch:true
  
  has_many :mentions
  accepts_nested_attributes_for :mentions
  has_many :users, through: :mentions
end
