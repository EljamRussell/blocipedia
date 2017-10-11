require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user

    @wiki = FactoryGirl.create(:wiki, user_id: @user.id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: @wiki.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {id: @wiki.id}
      expect(response).to have_http_status(:success)
    end
  end

end
