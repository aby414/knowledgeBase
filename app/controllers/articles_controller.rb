class ArticlesController < ApplicationController

  #get all articles
  def index
    @articles = Article.all
  end

  #create new article
  def new
    @article = Article.new
  end

  #get on e article by id
  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if(@article.update(article_params))
      redirect_to @article
    else
      render 'new'
    end
  end

  #delete an article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def create
    @article = Article.new(article_params)

    if(@article.save)
      redirect_to @article
    else
      render 'edit'
    end

  end

  private def article_params
    params.require(:article).permit(:title, :body)
  end
end
