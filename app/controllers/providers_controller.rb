class ProvidersController < ApplicationController
  def index
    if params[:user_id]
      providers = Provider.by_user_id(params[:user_id])
      render json: ProviderSerializer.new(providers)
    else
      providers = Provider.all
      render json: ProviderSerializer.new(providers)
    end
  end

  def create
    
    provider = Provider.create(provider_params)
    
    render json: ProviderSerializer.new(provider)
  end

  def show
    if params[:type] == "bartending"
      provider = Provider.all.select{|p| p.category == "Bartending"}.sample
      
      render json: ProviderSerializer.new(provider)
    else
      provider = Provider.all.select{|p| p.category == "Food Truck"}.sample
      render json: ProviderSerializer.new(provider)
    end
    
  end

  def update
    provider = Provider.find(params[:id])
		provider.update(provider_params)
		render json: ProviderSerializer.new(provider)
  end

  def destroy
		provider = Provider.find(params[:id])
		provider.destroy
		render json: { message: "Sorry to hear of your loss 💀💔" }
  end
  
  private

  def provider_params
    params.require(:provider).permit(:biz_name, :tax_id, :placeholder_image, :website, :yelp, :biz_phone, :category, :user_id, images: [])
  end
end

# {
#   "provider": {
#     "biz_name": "Ralph's",
#     "tax_id": "1234",
#     "photo_id": "hi",
#     "website": "señor-ralph.com",
#     "yelp": "Ralph Yelp",
#     "biz_phone": "1234566",
#   "category": "good stuff",
#   "user_id": 30
#   }
# }

