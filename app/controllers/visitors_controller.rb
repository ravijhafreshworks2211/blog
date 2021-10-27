class VisitorsController < ApplicationController

  
    def contact
      h = JSON.generate({ 'name' => params[:name],
                          'email' => params[:email],
                          'message' => params[:message] })
     
      PostmanWorker.perform_async(h, 10)
      PostmanWorker.perform_in(10.minutes,h,1)

  
      # if instead of sidekiq I was just sending email from rails
       @name=params[:name]
      @email=params[:email]
      @message=params[:message]
      VisitMailer.contact_email(@name, @email, @message).deliver 
      
  
     # redirect_to :root
    end

    def search_articles
      query = params[:search_articles].presence && params[:search_articles][:query]
    
      if query
        @searched_article = Article.search_published(query)
      end
    end
    
end
