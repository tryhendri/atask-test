class Api::MainController < ActionController::API

  def index
    render json: "Welcome to the API", status: :ok
  end
end
