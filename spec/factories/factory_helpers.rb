require 'countries'

module FactoryHelpers
  extend self

  def country_codes
    @country_codes||=Country.all { |_, data| data['number'] }
  end
end