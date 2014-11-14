# Controller for application
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authenticate_pass!
    if pass_signed_in?
      super
    else
      flash[:notice] = 'Please sign in to continue'
      redirect_to :welcome_index && return
    end
  end
end
