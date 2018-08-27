module ControllerMacros
  def login_passenger
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      passenger = FactoryBot.create(:passenger)
      sign_in passenger
    end
  end

  def login_driver
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      driver = FactoryBot.create(:driver)
      sign_in driver
    end
  end
end