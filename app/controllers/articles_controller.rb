class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    # debugger
    @article = Article.new(article_params)
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :author)
  end
end
