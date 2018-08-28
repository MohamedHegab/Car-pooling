describe Trip, type: :model do
	before { @trip = FactoryBot.build(:trip) }

  subject { @trip }

  it { should belong_to(:driver) }
  it { should belong_to(:source) }
  it { should belong_to(:destination) }

	it { should validate_numericality_of(:number_of_seats).is_greater_than_or_equal_to(3) }

	it { @trip.departure_time = DateTime.now - 2
	expect(@trip).not_to be_valid }
end