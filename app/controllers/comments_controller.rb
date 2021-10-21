class CommentsController < ApplicationController

    def index 
        @users = User.all
    end
    
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        users_ids = params[:mentions][:users]
        users_ids.each do |uid|
            if !uid.empty?
                @comment.mentions.push(Mention.create(user:User.find(uid),comment:@Comment))
            end
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
