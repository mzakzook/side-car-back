class FindUserController < ApplicationController
  def index
    user = User.all.find{|user| user.authentication_token == params[:token]}
    render json: user
  end
end


# {
#   "event": {
#     "title": "Crab Cookoff",
#     "edate": "2020-1-16",
#     "description": "Come together for some shell cracking and good grub",
#     "provider_id": 1
#   }
# }


