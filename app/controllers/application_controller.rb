class ApplicationController < ActionController::API
  
  private

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user!

    unless logged_in?
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
