class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "作成しました"
    else
      render :new, alert: "作成できませんでした"
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "更新できました"
    else
      render :edit, alert: "更新出来ませんでした"
    end
  end

  def destroy
  　if  @article.destroy
    　　redirect_to root_path, notice: "削除しました"
  　else
    　　redirect_to root_path, notice: "削除出来ませんでした、再度お試し下さい"
    end
  end

  private
  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
