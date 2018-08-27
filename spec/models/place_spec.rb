describe Place do
  before { @place = FactoryBot.build(:place) }

  subject { @place }

	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:longitude) }
	it { should validate_presence_of(:latitude) }

	it { should validate_uniqueness_of(:name) }
	it { should validate_uniqueness_of(:longitude).scoped_to(:latitude) }
end