require 'rails_helper'

RSpec.feature 'User can log in w/ GitHub' do
  context 'An existing user has valid credentials' do

    before do
      stub_oauth
    end

    scenario 'The user clicks login on root path' do
      visit '/'

      expect(page.status_code).to eq 200
      click_link 'Sign in with GitHub'

      expect(current_path).to eq dashboard_path
      expect(page.body).to have_content "Signed in as VictoriaVasys"
      expect(page.body).to have_link 'Sign out'
    end
  end
end