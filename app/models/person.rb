class Person < ActiveRecord::Base
  belongs_to :company

  markable_as :favorite
end
