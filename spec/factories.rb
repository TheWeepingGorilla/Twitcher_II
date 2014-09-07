FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@test.com"
  end

  factory :user do
    email
    password "testtest"
    password_confirmation "testtest"
  end
end
