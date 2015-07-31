#require './factory_helper'

FactoryGirl.define do
  factory :company do
    name {Faker::Company.name}
    country_code {FactoryHelpers.country_codes.sample}

    factory :company_with_people do
      transient do
        people_count 5
      end
      after(:create) do |company, evaluator|
        create_list(:person, evaluator.people_count, company: company)
      end
    end
  end
end
