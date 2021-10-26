class CommentsController < ApplicationController

    def index 
        @users = User.all
    end
    
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        users_ids = params[:mentions][:users].reject{|c| c.empty?}
        #@comment.mentions = params[:mentions][:users].reject{|c| c.empty? }.each.map{ |user_id| Mention.new(user: User.find(user_id)) }
        @comment.mentions_attributes = params[:mentions][:users].reject{|c| c.empty? }.each.map{ |user_id| {user_id: user_id} }
        @comment.save 
        emails = User.select('email').where(id:users_ids)
        emails.each do |e|
            map = {'email':e,'subject':'Mentioned','body':'You have been mentioned'}
            PostmanWorker.perform_async(map,5)
        end
        
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
    
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
    end
end
