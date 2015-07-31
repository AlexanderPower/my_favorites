FactoryGirl.define do
  factory :person do
    name {Faker::Name.name}
    #company nil
  end

end
