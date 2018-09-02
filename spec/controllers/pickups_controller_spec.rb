require 'rails_helper'

RSpec.describe PickupsController, type: :controller do
	login_passenger

  let(:valid_attributes) { FactoryBot.build(:pickup).attributes }

  let(:invalid_attributes) { FactoryBot.attributes_for(:pickup, source: nil)}

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new pickup" do
        expect{post :create, params: {pickup: valid_attributes}}.to change(Pickup ,:count).by(1)
      end
      it "redirects to pickup#show" do
        post :create, params: {pickup: valid_attributes}
        expect(response).to redirect_to dashboard_path
      end
    end
    context "with invalid attributes" do
      it "does not save" do
        expect{post :create, params: {pickup: invalid_attributes}}.to_not change(Pickup, :count)
      end
      it "re-renders the :show template" do
        post :create, params: {pickup: invalid_attributes}
        expect(response).to render_template "passenger_dashboards/show"
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @pickup = FactoryBot.create(:pickup)
    end
    it "deletes the purchase invoice" do
      expect{delete :destroy , params: { id: @pickup }}.to change(Pickup, :count).by(-1)
    end
    it "redirects to pickups #index" do
      delete :destroy, params: { id: @pickup }
      expect(response).to redirect_to dashboard_path
    end
  end
end
