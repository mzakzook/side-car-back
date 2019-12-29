class ProviderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :biz_name, :tax_id, :photo_id, :website, :yelp, :biz_phone, :category, :user_id
  has_many :events
end

