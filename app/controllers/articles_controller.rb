class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    respond_to do |format|
      if @article.save
        format.html {redirect_to @article, notice: "article created"}
      else
        format.html {render :new}
      end

    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @article = Article.update(article_params)
        format.html{ redirect_to @article, notice: "article updated"}
      else
        format.html{ render :show}
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html{redirect_to articles_path, notice: "element destroyed"}
    end
  end
  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
