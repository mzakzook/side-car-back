class ProviderSerializer
  include FastJsonapi::ObjectSerializer
  set_type :provider
  attributes :id, :biz_name, :tax_id, :placeholder_image, :website, :yelp, :biz_phone, :category, :user_id
  has_many :events

  attribute :images do |provider|
    
    provider.images.map {|image| Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) }
  end
end

