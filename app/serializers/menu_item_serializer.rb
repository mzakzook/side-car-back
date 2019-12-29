class MenuItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :beverage, :item_cat, :img_url, :description, :vegan, :vegetarian
  belongs_to :provider 
end

