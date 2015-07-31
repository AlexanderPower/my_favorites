require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :index => "Index",
        :show => "Show"
      ),
      Company.create!(
        :index => "Index",
        :show => "Show"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "Show".to_s, :count => 2
  end
end
