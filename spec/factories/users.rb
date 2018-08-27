FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    full_name { FFaker::Name.name }
    password { 'MyPassword123' }
    password_confirmation { 'MyPassword123' }
    phone_number { FFaker::PhoneNumberAU.mobile_phone_number }
    
    factory :driver do
        after(:create) {|user| user.add_role "driver"}
    end

    factory :passenger do
        after(:create) {|user| user.add_role "passenger" }
    end
  end
end