# Controller for User
class UserController < ApplicationController
  # Register new user
  def create_user
    @register = User.new user_params
    if @register.save
      redirect_to :dashboard_index
    else
      @login = User.new
      render 'welcome/index'
    end
  end

  # Login existing user
  def sign_in_user
    @login = User.find_by email: user_params[:email]

    if @login && @login.login_user(user_params[:password])
      sign_in :pass, @login.pass
      redirect_to :dashboard_index
    else
      @login = User.new user_params
      @register = User.new
      render 'welcome/index'
    end
  end

  private

  def user_params
    allow = [:email, :password, :password_confirmation]
    # binding.pry
    params.require(:user).permit(allow)
  end
end
