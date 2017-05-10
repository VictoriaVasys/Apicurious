require 'rails_helper'

RSpec.feature 'User can log in w/ GitHub' do
  context 'An existing user has valid credentials' do

    before do
      stub_oauth
    end

    def stub_oauth
      OmniAuth.config.test_mode = true

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                           provider: 'github',
                                           uid: '1234',
                                           info: {
                                            name: 'Victoria V',
                                            nickname: 'vic',
                                            email: 'vv@gmail.com',
                                            image_url: 'https://avatars3.githubusercontent.com/u/10079657?v=3'
                                           },
                                           credentials: {
                                             token: 'pizza'
                                           },
                                           extra: {
                                             raw_info: {
                                               follwers_url: 'https://api.github.com/users/VictoriaVasys/followers',
                                               following_url: 'https://api.github.com/users/VictoriaVasys/following{/other_user}',
                                               starred_url: 'https://api.github.com/users/VictoriaVasys/starred{/owner}{/repo}',
                                               organizations_url: 'https://api.github.com/users/VictoriaVasys/orgs',
                                               repos_url: 'https://api.github.com/users/VictoriaVasys/repos',
                                               events_url: 'https://api.github.com/users/VictoriaVasys/events{/privacy}'
                                             }
                                           }
      })
    end

    scenario 'The user clicks login on root path' do
      visit '/'

      expect(page.status_code).to eq 200
      click_link 'Sign in with GitHub'

      expect(current_path).to eq dashboard_path
      expect(page.body).to have_content "Signed in as #{User.last.username}"
      expect(page.body).to have_link 'Sign out'
    end
  end
end