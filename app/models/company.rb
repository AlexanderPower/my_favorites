class Company < ActiveRecord::Base
  has_many :people, dependent: :destroy

  markable_as :favorite
end
