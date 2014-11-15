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
    @user_profile = current_pass.user
  end

  def profile_update
    @user_profile = current_pass.user
    if needs_password?(user_params)
      if @user_profile.update user_params
      else
      end
    else
      if @user_profile.update_without_password user_params
      else
      end
    end
    sign_out :pass
    pass = Pass.find_by user: @user_profile
    sign_in :pass, pass
    render :profile
  end

  private

  def needs_password?(user_params)
    !user_params[:password].blank?
  end

  def user_params
    allow = [:username, :email, :password, :password_confirmation]
    # binding.pry
    params.require(:user).permit(allow)
  end
end
