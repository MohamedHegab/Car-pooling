describe User do
  before { @user = FactoryBot.build(:passenger) }

  subject { @user }

	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:full_name) }
	it { should validate_presence_of(:phone_number) }

	it { should validate_uniqueness_of(:email).case_insensitive }
	it { should validate_uniqueness_of(:phone_number).case_insensitive }
	it { should validate_confirmation_of(:password) }
end