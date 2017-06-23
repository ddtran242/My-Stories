require "rails_helper"

RSpec.describe StoriesController, type: :controller do
  before do
    current_user = FactoryGirl.create(:user)
  end

  describe "GET new" do
    it "render the new plan template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    it "redirect to the home template" do
      params = {name: "new plan", description: "create a new plan",
        is_public: false, due_date: "2017-06-23T01:00"}
      post :create, params: {story: params}
      expect(response).to redirect_to(root_path)
    end

    it "render new template" do
      params = {name: nil, description: "create a new plan",
          is_public: false, due_date: "2017-06-23T01:00"}
      post :create, params: {story: params}
      expect(response).to render_template("new")
    end
  end

  describe "GET edit" do
    it "render the edit plan template" do
      get :edit, id: 1
      expect(response).to render_template("edit")
    end
  end

  # describe "Patch update" do
  #   it "redirect to the home template" do
  #     params = {name: "new plan", description: "create a new plan",
  #       is_public: false, due_date: "2017-06-23T01:00"}
  #     patch :update, id: 1, params: {story: params}
  #     expect(response).to redirect_to(root_path)
  #   end

  #   it "render new template" do
  #     params = {name: nil, description: "create a new plan",
  #         is_public: false, due_date: "2017-06-23T01:00"}
  #     patch :update, id: 1, params: {story: params}
  #     expect(response).to render_template("edit")
  #   end
  # end

end
