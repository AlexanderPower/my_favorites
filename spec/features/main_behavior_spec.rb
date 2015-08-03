require 'rails_helper'

describe 'main user behavior' do
  it 'sign_up with valid email and password' do
    user= build :user
    sign_up_with user.email, user.password
    expect(page).to have_content('My favorites')
  end
  context 'user actions' do
    let!(:company1) { create :company_with_people }
    let!(:company2) { create :company_with_people }
    let(:person1) { company1.people[0] }
    let(:person2) { company1.people[1] }
    before(:each) { sign_in }

    context 'vist pages' do
      it 'root path' do
        visit root_path
        expect(page).to have_content company1.name
        expect(page).to have_content company2.name
      end
      it 'company1 path' do
        visit company_path company1
        company1.people.each do |person|
          expect(page).to have_content person.name
        end
      end
    end

    it 'user added company and people to favorite', js: true do
      visit root_path
      # click by empty star
      # find("[data-id='#{company1.id}']").click
      find(".company-#{company1.id}").click
      wait_for_ajax
      # have filled star
      expect(page).to have_css '.fa-star'

      visit company_path company1
      find(".person-#{person1.id}").click
      find(".person-#{person2.id}").click
      wait_for_ajax

      visit favorites_path
      expect(page).to have_content company1.name
      expect(page).to have_content person1.name
      expect(page).to have_content person2.name

      expect(page).to have_no_content company2.name
    end
  end
end