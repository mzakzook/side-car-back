class MenuItemsController < ApplicationController
  def index
    menu_items = MenuItem.all.select{|mi| mi.provider_id == params[:provider_id].to_i}
    render json: MenuItemSerializer.new(menu_items)
  end

  def create
    menu_item = MenuItem.create(menu_item_params)
    render json: MenuItemSerializer.new(menu_item)
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:beverage, :item_cat, :img_url, :description, :vegan, :vegetarian, :provider_id)
  end
end


# {
#   "menu_item": {
#     "beverage": false,
#     "item_cat": "BBQ",
#     "img_url": "hi",
#     "description": "good stuff",
#     "vegan": false,
#     "vegetarian": false,
#   "provider_id": 1
#   }
# }
