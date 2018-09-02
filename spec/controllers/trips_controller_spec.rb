require 'rails_helper'

RSpec.describe TripsController, type: :controller do
	login_driver

  let(:valid_attributes) { FactoryBot.build(:trip).attributes }

  let(:invalid_attributes) { FactoryBot.attributes_for(:trip, source: nil)}

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new trip" do
        expect{post :create, params: {trip: valid_attributes}}.to change(Trip ,:count).by(1)
      end
      it "redirects to trip#show" do
        post :create, params: {trip: valid_attributes}
        expect(response).to redirect_to dashboard_path
      end
    end
    context "with invalid attributes" do
      it "does not save" do
        expect{post :create, params: {trip: invalid_attributes}}.to_not change(Trip, :count)
      end
      it "re-renders the :show template" do
        post :create, params: {trip: invalid_attributes}
        expect(response).to render_template "driver_dashboards/show"
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @trip = FactoryBot.create(:trip)
    end
    it "deletes the purchase invoice" do
      expect{delete :destroy , params: { id: @trip }}.to change(Trip, :count).by(-1)
    end
    it "redirects to trips #index" do
      delete :destroy, params: { id: @trip }
      expect(response).to redirect_to dashboard_path
    end
  end
end
