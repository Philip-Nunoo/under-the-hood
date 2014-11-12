require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET coming_soon" do
    it "returns http success" do
      get :coming_soon
      expect(response).to have_http_status(:success)
    end
  end

end
