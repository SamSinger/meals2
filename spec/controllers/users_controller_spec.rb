require 'spec_helper'

describe UsersController do  
  describe "GET index" do
     it "assigns @users" do
      user = User.create
      get :index
      expect(assigns(:users)).to eq([user])
    end
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    describe "GET new" do
      it "sets the @user variable" do
        get :new
        expect(:user).to be_new_record 
        #expect(:user).to be_an_instance_of(User)
      end
      it "renders the new template" do
        expect(:index).to render_template("new")
      end
    end
    describe "POST create" do
      it "creates the user record when input is valid" do
        post :create, user: {firstname: "Sam", lastname: "Singer", email: "s@auburn.edu", organization_name: "auburn"}  
        expect(user).to eq(user)     
      end
      it "redirects to  the root path when the input is valid" do
        post :create, user: {firstname: "Sam", lastname: "Singer", email: "s@auburn.edu", organization_name: "auburn"}  
        expect(response).to redirect_to root_path
      end
      it "does not create a user when the input is invalid" do 
        post :create, user: {firstname: "Sam", lastname: "Singer", email: "s@auburn.edu"}  
        expect(user.count).to eq(0)  
      end
      it "renders new when the input is invalid" do 
        post :create, user: {firstname: "Sam", lastname: "Singer", email: "s@auburn.edu"}  
        expect(response).to redirect_to "new"
      end
            
    end
  end  
end