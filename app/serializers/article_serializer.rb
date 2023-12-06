class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :author, :email, :image
  attribute :image do |object|
    host ="http://127.0.0.1:3000"
    #byebug
    if @object.image.attached?
      #byebug
      host + Rails.application.routes.url_helpers.rails_blob_url(@object.image, only_path: true)
    else
      nil
    end
  end
end
