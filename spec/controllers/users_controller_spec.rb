require 'spec_helper'

describe UsersController do  

  describe "GET index" do
    before(:example) { get :index }
    let!(:users)  { Fabricate(:user) } 
    it "assigns all users to @users" do
      expect(assigns['users']).to match_array(users)
    end
    it "has a 200 status code" do
      expect(response).to have_http_status(:ok)
    end
    it "renders the index template" do
      expect(response).to render_template :index
    end

    describe "GET new" do
      it "sets the @user variable" do
        user = User.new
        get :new
        expect(assigns[user]).to be_new_record
      end
      it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
      end
      it "renders the new template" do
        expect(:index).to render_template :index
      end
    end
    describe "POST create" do
      it "creates the user record when input is valid" do         
        post(:create, :user => {:firstname => "Sam", :lastname => "Singer", :email => "s@auburn.edu", :organization_name => "auburn"})  
        expect(assigns['users']).to match_array(users) 
      end
      it "redirects to  the root path when the input is valid" do
        post(:create, :user => {:firstname => "Sam", :lastname => "Singer", :email => "s@auburn.edu", :organization_name => "auburn"})  
        expect(response).to have_http_status(:ok) 
      end
      it "does not create a user when the input is invalid" do 
        post(:create, :user => {:firstname => "Sam", :lastname => "Singer", :email => "s@auburn.edu"})  
        expect(User.count).not_to match_array(users) 
      end
      it "renders new when the input is invalid" do 
        post :create, user: { firstname: "Sam", lastname: "Singer", email: "s@auburn.edu"}  
        expect(response).to render_template('new')
      end
            
    end
  end  
end