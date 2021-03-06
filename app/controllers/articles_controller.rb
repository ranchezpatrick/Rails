class ArticlesController < ApplicationController
    before_action :set_article, only:[:show, :edit, :update, :destroy]
    
    def index 
        @articles = Article.all
    end

    def new
        @article = Article.new
    end


    def show
        @comments = @article.comments
        @comment = @article.comments.build
    end
    

    def create
        article_params = params.require(:article).permit(:title, :author, :content)
        @article = Article.new(article_params)
        
        if @article.save
            flash[:error] = "an article was successfully created"
            redirect_to articles_path
        else 
            flash[:error] = "Blank"
            render :new
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
        redirect_to articles_path, notice: "Updated an article"
        else
            flash[:error] = "Blank field"
            render :edit
        end
    end
    
    def destroy
        
        @article.destroy
        redirect_to articles_path, notice: "an Article was successfully destoyed"
      end
    
    private

    def article_params
        params.require(:article).permit(:title, :author, :content)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end

