require "spec_helper"

describe UsersController do
  describe "POST create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, user: {:name => "test_name", :email => "test_email"}
        }.to change(User,:count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not create a new user with empty name and email" do
        expect{
          post :create, user: {:name => "", :email => ""}
        }.to_not change(User,:count).by(1)
      end

      it "does not create a new user with empty name" do
        expect{
          post :create, user: {:name => "", :email => "test_email"}
        }.to_not change(User,:count).by(1)
      end

      it "does not create a new user with empty email" do
        expect{
          post :create, user: {:name => "test_name", :email => ""}
        }.to_not change(User,:count).by(1)
      end
    end
  end
end
