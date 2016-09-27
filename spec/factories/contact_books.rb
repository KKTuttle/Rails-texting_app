FactoryGirl.define do
  factory :contact_book do
    # name Faker::Book.genre
    name "MyContactBook"
    user
  end
end
