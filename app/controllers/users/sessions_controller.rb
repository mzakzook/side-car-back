class Users::SessionsController < Devise::SessionsController
  include ActionController::MimeResponds

  def create
    # byebug
    respond_to do |format|
       format.any(*navigational_formats) { super }
       format.json do
         self.resource = warden.authenticate!(auth_options)
         sign_in(resource_name, resource)
         respond_with_authentication_token(resource)
       end
    end
  end

  protected

  def respond_with_authentication_token(resource)
    render json: {
      success: true,
      auth_token: resource.authentication_token,
      email: resource.email,
      first_name: resource.first_name,
      last_name: resource.last_name,
      cell_number: resource.cell_number,
      avatar: resource.avatar,
      id: resource.id
    }
  end

end