class Mention < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  after_create :notify

  def notify
    VisitMailer.contact_email('You', self.user.email, "You have mentions in comment").deliver 
  end
end
