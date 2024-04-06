class Admin::ArticlesController < Admin::ApplicationController
  before_action :find_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to admin_articles_path
    else
      redirect_to new_admin_article_path
    end
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to edit_admin_article_path(@article)
  end

  def destroy
    if @article.destroy
      flash[:success] = 'Article was successfully destroyed'
      redirect_to admin_articles_path
    else
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.required(:article).permit(
      :title, :description
    )
  end
end
