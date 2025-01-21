class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :set_article, only: %i[show edit update destroy]
    before_action :authorize_user!, only: %i[edit update destroy]
  
    def index
      @articles = Article.all
    end
  
    def show; end
  
    def new
      @article = current_user.articles.build
    end
  
    def create
      @article = current_user.articles.build(article_params)
  
      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit; end
  
    def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
          redirect_to articles_path, notice: 'Article was successfully deleted.'
        else
          redirect_to articles_path, alert: 'Article could not be deleted.'
        end
      end
      
    
  
    private
  
    def set_article
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :body)
    end
  
    def authorize_user!
      return if @article.user == current_user
  
      redirect_to articles_path, alert: 'You are not authorized to perform this action.'
    end
  end
  
    
    
  
   
  
  