# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end

def stub_oauth
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                       provider: 'github',
                                       uid: '1234',
                                       info: {
                                        name: 'Victoria V',
                                        nickname: 'VictoriaVasys',
                                        email: 'vv@gmail.com',
                                        image: 'https://avatars3.githubusercontent.com/u/10079657?v=3'
                                       },
                                       credentials: {
                                         token: ENV['GITHUB_USER_TOKEN']
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

def stub_github_user
  {
    :login=>"VictoriaVasys",
    :id=>10079657,
    :avatar_url=>"https://avatars3.githubusercontent.com/u/10079657?v=3",
    :followers_url=>"https://api.github.com/users/VictoriaVasys/followers",
    :following_url=>"https://api.github.com/users/VictoriaVasys/following{/other_user}",
    :gists_url=>"https://api.github.com/users/VictoriaVasys/gists{/gist_id}",
    :starred_url=>"https://api.github.com/users/VictoriaVasys/starred{/owner}{/repo}",
    :subscriptions_url=>"https://api.github.com/users/VictoriaVasys/subscriptions",
    :organizations_url=>"https://api.github.com/users/VictoriaVasys/orgs",
    :repos_url=>"https://api.github.com/users/VictoriaVasys/repos",
    :events_url=>"https://api.github.com/users/VictoriaVasys/events{/privacy}",
    :received_events_url=>"https://api.github.com/users/VictoriaVasys/received_events",
    :site_admin=>false,
    :name=>"Victoria Vasys",
    :company=>"@turingschool",
    :location=>"Denver, CO",
    :email=>"victoria.vasys@gmail.com",
    :bio=>"I'm a student in the Back-End Engineering Program at Turing School of Software & Design.",
    :public_repos=>35,
    :public_gists=>12,
    :followers=>2,
    :following=>32,
    :created_at=>"2014-12-04T21:03:00Z",
    :updated_at=>"2017-04-10T18:33:58Z"
  }
end

def stub_github_user_collection
  [
    stub_github_user,
    stub_github_user,
    stub_github_user
  ]
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<GITHUB_KEY>') { ENV['GITHUB_KEY'] }
  config.filter_sensitive_data('<GITHUB_SECRET>') { ENV['GITHUB_SECRET'] }
  config.filter_sensitive_data('<GITHUB_USER_TOKEN>') { ENV['GITHUB_USER_TOKEN'] }
  config.allow_http_connections_when_no_cassette = true
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
