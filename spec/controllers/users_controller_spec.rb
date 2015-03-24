require 'spec_helper'

describe UsersController do  
  describe "GET index" do
    it "sets the @users variable" do
      user = User.create(firstname: "Bill",
        lastname: "Singer",
        email: "bill@auburn.edu",
        password_digest: "password",
        role: "admin",
        organization_name: "Paul's disciples")
      get :index
      assigns(:users).should == [user]
    end
    it "renders the index template"
  end  
end