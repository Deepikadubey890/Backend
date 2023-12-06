class Api::V1::ArticlesController < ApplicationController
  def index
    article = Article.all
    render json: article, status: 200
  end

  def show
  end

  def create
    @article = Article.new(arti_params)
    host ="http://127.0.0.1:3000"

    if @article.image.attached?
     host +  Rails.application.routes.url_helpers.rails_blob_url(@article.image, only_path: true)
    end
    if @article 
      NotifierMailer.alert_article(@article).deliver
      @article.save
      render json: @article#,Serializer: ArticleSerializer
    else
      render json: { error: "not created"}
    end
  end

  def update
  end

  def destroy
  end

  private 
  def arti_params
  params.require(:article).permit([
    :name,
    :author,
    :email,
    :image
  ])
  end  
end
