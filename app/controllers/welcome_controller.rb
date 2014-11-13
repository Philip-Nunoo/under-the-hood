class WelcomeController < ApplicationController
  def index
  	@user = User.new
  end

  def coming_soon
  end
end
