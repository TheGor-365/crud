class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all.published.by_creation_date_desc
    # @articles = Article.all.where(published: true).order(created_at: :desc)
    # @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    # debugger
    @author = Author.create(author_params)
    @article = Article.new(article_params)
    @article.author_id = @author.id

    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @author = Author.find(params[:id])
  end
  def edit; end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path
    else
      redirect_to article_path(@article)
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(
      :title,
      :body,
      :edited_at,
      :published,
      :author
    )
  end

  def author_params
    params.require(:article).require(:author).permit(
      :name
    )
  end
end
