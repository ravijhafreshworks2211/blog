class VisitMailer < ApplicationMailer
    def contact_email(name, email, message)
        @name = name
        @email = email
        @message = message
        mail(from: @email,
             to: 'noreply@freshworks.com',
             subject: 'New Visitor\'s Email')
      end
end
