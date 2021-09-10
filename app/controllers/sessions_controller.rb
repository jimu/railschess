class SessionsController < ApplicationController
  skip_before_action :authorize

  # Create is called with name and password
  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path
    else
      redirect_to login_path, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end

