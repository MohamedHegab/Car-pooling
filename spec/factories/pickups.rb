FactoryBot.define do
  factory :pickup do
  	passenger
    source { create(:place, longitude: '-73.8454648940358') }
    destination { create(:place, longitude: '-122.078250641083') }
    departure_time { DateTime.now + 1 }
  end
end
