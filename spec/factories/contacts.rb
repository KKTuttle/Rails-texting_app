FactoryGirl.define do
  factory :contact do
    name Faker::Name.name
    phone "15005550006"
    contact_book
  end
end
