# Controller for Dashboard
class DashboardController < ApplicationController
  before_action :authenticate_pass!

  def logout
    sign_out :pass
    redirect_to :root
  end

  def index
    @users = User.all
  end

  def profile
    @user_profile = User.new
  end
end
