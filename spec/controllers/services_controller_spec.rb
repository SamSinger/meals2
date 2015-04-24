require 'spec_helper'

describe ServicesController do
  let(:services_controller)  { ServicesController.new } 
  describe "GET index" do         
    it "assigns all services to @services" do
      expect(assigns[services]).to match(@services)
    end
   it "has a 200 status code" do
      expect(response).to have_http_status(302)
    end
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end
  describe "POST create" do
      it "creates the service record when input is valid" do
        post :create, service: {name: "serve a meal"}  
        expect(service).to eq(service)     
      end
      it "redirects to  the root path when the input is valid" do
        post :create, service: {name: "serve a meal"}  
        expect(response).to redirect_to root_path
      end
      it "does not create a service when the input is invalid" do 
        post :create, service: { }  
        expect(service.count).to eq(0)  
      end
      it "renders new when the input is invalid" do 
        post :create, service: {}  
        expect(response).to redirect_to "new"
      end
            
    end
end