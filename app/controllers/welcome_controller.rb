# Controller to be used with the welcome page
# Extends the Application Controller
class WelcomeController < ApplicationController
    def index
        @login = User.new
        @register = User.new
    end

    def coming_soon
    end
end
