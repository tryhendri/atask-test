class Api::V1::AuthorizationsController < Api::V1::BaseController
  def create
    user = User.authenticate(params[:authorization])
    if user
      session[:user_id] = user.id
      render json:  current_user
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
