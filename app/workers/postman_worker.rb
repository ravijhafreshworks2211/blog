class PostmanWorker
  include Sidekiq::Worker

  def perform(h,count)
    h = JSON.load(h)
    puts "Sidekiq is working"
    VisitMailer.contact_email(h['name'], h['email'], h['message']).deliver
  end
  
end
