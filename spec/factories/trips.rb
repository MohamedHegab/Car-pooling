FactoryBot.define do
  factory :trip do
    driver
    source { create(:place, longitude: '-73.8454648940358') }
    destination { create(:place, longitude: '-122.078250641083') }
    departure_time { DateTime.now }
    number_of_seats { 5 }
  end
end
