FactoryBot.define do
  factory :place do
    name { FFaker::Address.street_name }
    longitude { FFaker::Geolocation.lng }
    latitude { FFaker::Geolocation.lat }
  end
end
