class ArticlesController < ApplicationController
  def index
    @article = Article.paginate(:page => params[:page], :per_page => 10).order(:title)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article added"
      redirect_to articles_path
    else
      flash[:danger] = "something wong"
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
      flash[:success] = "yay"
      redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title,:description)
  end
end
