describe Pickup, type: :model do
	before { @pickup = FactoryBot.build(:pickup) }

  subject { @pickup }

  it { should belong_to(:passenger) }
  it { should belong_to(:source) }
  it { should belong_to(:destination) }

	it { @pickup.departure_time = DateTime.now - 2
	expect(@pickup).not_to be_valid }

end
