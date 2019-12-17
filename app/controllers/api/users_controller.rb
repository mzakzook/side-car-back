class Api::V1::UsersController < ActionController::Base
  before_action :authenticate_user!
  respond_to :json

  def index
    users = User.all
    render :json => users
  end 

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create


  end


  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :password, :cell_number, :avatar)
  end


end