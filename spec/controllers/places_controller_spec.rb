require 'rails_helper'

RSpec.describe PlacesController, type: :controller do

  login_driver

  let(:valid_attributes) { FactoryBot.attributes_for(:place)}

  let(:invalid_attributes) { FactoryBot.attributes_for(:place, name: nil)}
  
  describe 'GET #index' do
    it "populates an array of all places" do
      place = FactoryBot.create(:place)
      get :index
      expect(assigns(:places)).to match_array([place])
    end    
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new format js" do
    it "returns http success" do
      get :new, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new format html" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create format js" do
    context "with valid attributes" do
      it "saves the new place" do
        expect{post :create, xhr: true, params: {place: valid_attributes}}.to change(Place ,:count).by(1)
      end
      it "redirects to place#show" do
        post :create, xhr: true, params: {place: valid_attributes}
        expect(response).to redirect_to places_path
      end
    end
    context "without invalid attributes" do
      it "does not save" do
        expect{post :create, xhr: true, params: {place: invalid_attributes}}.to_not change(Place, :count)
      end
      it "re-renders the :new template" do
        post :create, xhr: true, params: {place: invalid_attributes}
        expect(response).to render_template :new
      end
    end
  end

  describe "POST #create format html" do
    context "with valid attributes" do
      it "saves the new place" do
        expect{post :create, params: {place: valid_attributes}}.to change(Place ,:count).by(1)
      end
      it "redirects to place#show" do
        post :create, params: {place: valid_attributes}
        expect(response).to redirect_to places_path
      end
    end
    context "without invalid attributes" do
      it "does not save" do
        expect{post :create, params: {place: invalid_attributes}}.to_not change(Place, :count)
      end
      it "re-renders the :new template" do
        post :create, params: {place: invalid_attributes}
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @place = FactoryBot.create(:place, name: "Cairo")
    end
    context "with valid attributes" do
      it "locates the requested @place" do
        patch :update, params: { id: @place ,place: valid_attributes }
        expect(assigns(:place)).to eq(@place)
      end
      it "changes @place attributes" do
        patch :update, params: { id: @place ,place: FactoryBot.attributes_for(:place,
            name: 'Alex',
            longitude: '11.552') }
        @place.reload
        expect(@place.name).to eq("Alex")
        expect(@place.longitude).to eq(11.552)
      end
      it "redirect to the updated place" do
        patch :update ,params: { id: @place ,place: valid_attributes }
        expect(response).to redirect_to places_path
      end
    end
    context "with invalid attributes" do
      it "does not change the place's attributes" do
        patch :update, params: { id: @place ,place: FactoryBot.attributes_for(:place,
          name: nil)  }
        @place.reload
        expect(@place.name).to_not eq(nil)
        expect(@place.name).to eq('Cairo')
      end
      it "re-renders the edit template" do
        patch :update, params: { id: @place ,place: invalid_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @place = FactoryBot.create(:place)
    end
    it "deletes the purchase invoice" do
      expect{delete :destroy , params: { id: @place }}.to change(Place, :count).by(-1)
    end
    it "redirects to places #index" do
      delete :destroy, params: { id: @place }
      expect(response).to redirect_to places_url
    end
  end
end
