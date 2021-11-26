class CommentsController < ApplicationController
    before_action :set_article

    

    def new 
        @comment = @article.comment.build
    end

    def create
        @comment = @article.comments.build(comment_params)

        if @comment.save
            redirect_to article_path(@article)
        else
            render :new
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_article
        @article = Article.find (params[:article_id])
    end
end
