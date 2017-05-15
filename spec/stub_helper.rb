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

def stub_repos
  [
  {
    "id": 87850331,
    "name": "superpower_shop",
    "full_name": "bschwartz10/superpower_shop",
    "owner": {
      "login": "bschwartz10",
      "id": 21000661,
      "avatar_url": "https://avatars3.githubusercontent.com/u/21000661?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/bschwartz10",
      "html_url": "https://github.com/bschwartz10",
      "followers_url": "https://api.github.com/users/bschwartz10/followers",
      "following_url": "https://api.github.com/users/bschwartz10/following{/other_user}",
      "gists_url": "https://api.github.com/users/bschwartz10/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/bschwartz10/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/bschwartz10/subscriptions",
      "organizations_url": "https://api.github.com/users/bschwartz10/orgs",
      "repos_url": "https://api.github.com/users/bschwartz10/repos",
      "events_url": "https://api.github.com/users/bschwartz10/events{/privacy}",
      "received_events_url": "https://api.github.com/users/bschwartz10/received_events",
      "type": "User",
      "site_admin": false
    },
    "private": false,
    "html_url": "https://github.com/bschwartz10/superpower_shop",
    "description": nil,
    "fork": false,
    "url": "https://api.github.com/repos/bschwartz10/superpower_shop",
    "forks_url": "https://api.github.com/repos/bschwartz10/superpower_shop/forks",
    "keys_url": "https://api.github.com/repos/bschwartz10/superpower_shop/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/bschwartz10/superpower_shop/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/bschwartz10/superpower_shop/teams",
    "hooks_url": "https://api.github.com/repos/bschwartz10/superpower_shop/hooks",
    "issue_events_url": "https://api.github.com/repos/bschwartz10/superpower_shop/issues/events{/number}",
    "events_url": "https://api.github.com/repos/bschwartz10/superpower_shop/events",
    "assignees_url": "https://api.github.com/repos/bschwartz10/superpower_shop/assignees{/user}",
    "branches_url": "https://api.github.com/repos/bschwartz10/superpower_shop/branches{/branch}",
    "tags_url": "https://api.github.com/repos/bschwartz10/superpower_shop/tags",
    "blobs_url": "https://api.github.com/repos/bschwartz10/superpower_shop/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/bschwartz10/superpower_shop/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/bschwartz10/superpower_shop/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/bschwartz10/superpower_shop/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/bschwartz10/superpower_shop/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/bschwartz10/superpower_shop/languages",
    "stargazers_url": "https://api.github.com/repos/bschwartz10/superpower_shop/stargazers",
    "contributors_url": "https://api.github.com/repos/bschwartz10/superpower_shop/contributors",
    "subscribers_url": "https://api.github.com/repos/bschwartz10/superpower_shop/subscribers",
    "subscription_url": "https://api.github.com/repos/bschwartz10/superpower_shop/subscription",
    "commits_url": "https://api.github.com/repos/bschwartz10/superpower_shop/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/bschwartz10/superpower_shop/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/bschwartz10/superpower_shop/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/bschwartz10/superpower_shop/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/bschwartz10/superpower_shop/contents/{+path}",
    "compare_url": "https://api.github.com/repos/bschwartz10/superpower_shop/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/bschwartz10/superpower_shop/merges",
    "archive_url": "https://api.github.com/repos/bschwartz10/superpower_shop/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/bschwartz10/superpower_shop/downloads",
    "issues_url": "https://api.github.com/repos/bschwartz10/superpower_shop/issues{/number}",
    "pulls_url": "https://api.github.com/repos/bschwartz10/superpower_shop/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/bschwartz10/superpower_shop/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/bschwartz10/superpower_shop/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/bschwartz10/superpower_shop/labels{/name}",
    "releases_url": "https://api.github.com/repos/bschwartz10/superpower_shop/releases{/id}",
    "deployments_url": "https://api.github.com/repos/bschwartz10/superpower_shop/deployments",
    "created_at": "2017-04-10T19:37:19Z",
    "updated_at": "2017-05-15T00:11:39Z",
    "pushed_at": "2017-05-15T00:17:02Z",
    "git_url": "git://github.com/bschwartz10/superpower_shop.git",
    "ssh_url": "git@github.com:bschwartz10/superpower_shop.git",
    "clone_url": "https://github.com/bschwartz10/superpower_shop.git",
    "svn_url": "https://github.com/bschwartz10/superpower_shop",
    "homepage": nil,
    "size": 11642,
    "stargazers_count": 1,
    "watchers_count": 1,
    "language": "CSS",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "forks_count": 0,
    "mirror_url": nil,
    "open_issues_count": 0,
    "forks": 0,
    "open_issues": 0,
    "watchers": 1,
    "default_branch": "master",
    "permissions": {
      "admin": false,
      "push": true,
      "pull": true
    }
  },
  {
    "id": 89948934,
    "name": "rales_engine",
    "full_name": "VictoriaVasys/rales_engine",
    "owner": {
      "login": "VictoriaVasys",
      "id": 10079657,
      "avatar_url": "https://avatars3.githubusercontent.com/u/10079657?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/VictoriaVasys",
      "html_url": "https://github.com/VictoriaVasys",
      "followers_url": "https://api.github.com/users/VictoriaVasys/followers",
      "following_url": "https://api.github.com/users/VictoriaVasys/following{/other_user}",
      "gists_url": "https://api.github.com/users/VictoriaVasys/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/VictoriaVasys/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/VictoriaVasys/subscriptions",
      "organizations_url": "https://api.github.com/users/VictoriaVasys/orgs",
      "repos_url": "https://api.github.com/users/VictoriaVasys/repos",
      "events_url": "https://api.github.com/users/VictoriaVasys/events{/privacy}",
      "received_events_url": "https://api.github.com/users/VictoriaVasys/received_events",
      "type": "User",
      "site_admin": false
    },
    "private": false,
    "html_url": "https://github.com/VictoriaVasys/rales_engine",
    "description": "This is our first Turing School Mod 3 project: We will be mastering our Rails skills, learn how to build single-responsibility controllers to provide a well-designed and versioned API, practice developing controller tests to drive design, and implement ActiveRecord methods to perform complicated business intelligence.",
    "fork": false,
    "url": "https://api.github.com/repos/VictoriaVasys/rales_engine",
    "forks_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/forks",
    "keys_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/teams",
    "hooks_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/hooks",
    "issue_events_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/issues/events{/number}",
    "events_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/events",
    "assignees_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/assignees{/user}",
    "branches_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/branches{/branch}",
    "tags_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/tags",
    "blobs_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/languages",
    "stargazers_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/stargazers",
    "contributors_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/contributors",
    "subscribers_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/subscribers",
    "subscription_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/subscription",
    "commits_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/contents/{+path}",
    "compare_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/merges",
    "archive_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/downloads",
    "issues_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/issues{/number}",
    "pulls_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/labels{/name}",
    "releases_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/releases{/id}",
    "deployments_url": "https://api.github.com/repos/VictoriaVasys/rales_engine/deployments",
    "created_at": "2017-05-01T18:06:42Z",
    "updated_at": "2017-05-10T01:30:33Z",
    "pushed_at": "2017-05-05T16:25:16Z",
    "git_url": "git://github.com/VictoriaVasys/rales_engine.git",
    "ssh_url": "git@github.com:VictoriaVasys/rales_engine.git",
    "clone_url": "https://github.com/VictoriaVasys/rales_engine.git",
    "svn_url": "https://github.com/VictoriaVasys/rales_engine",
    "homepage": nil,
    "size": 614,
    "stargazers_count": 1,
    "watchers_count": 1,
    "language": "Ruby",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "forks_count": 1,
    "mirror_url": nil,
    "open_issues_count": 0,
    "forks": 1,
    "open_issues": 0,
    "watchers": 1,
    "default_branch": "master",
    "permissions": {
      "admin": true,
      "push": true,
      "pull": true
    }
  },
  {
    "id": 85242710,
    "name": "bike-share",
    "full_name": "dannyradden/bike-share",
    "owner": {
      "login": "dannyradden",
      "id": 23153035,
      "avatar_url": "https://avatars1.githubusercontent.com/u/23153035?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/dannyradden",
      "html_url": "https://github.com/dannyradden",
      "followers_url": "https://api.github.com/users/dannyradden/followers",
      "following_url": "https://api.github.com/users/dannyradden/following{/other_user}",
      "gists_url": "https://api.github.com/users/dannyradden/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/dannyradden/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/dannyradden/subscriptions",
      "organizations_url": "https://api.github.com/users/dannyradden/orgs",
      "repos_url": "https://api.github.com/users/dannyradden/repos",
      "events_url": "https://api.github.com/users/dannyradden/events{/privacy}",
      "received_events_url": "https://api.github.com/users/dannyradden/received_events",
      "type": "User",
      "site_admin": false
    },
    "private": false,
    "html_url": "https://github.com/dannyradden/bike-share",
    "description": nil,
    "fork": true,
    "url": "https://api.github.com/repos/dannyradden/bike-share",
    "forks_url": "https://api.github.com/repos/dannyradden/bike-share/forks",
    "keys_url": "https://api.github.com/repos/dannyradden/bike-share/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/dannyradden/bike-share/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/dannyradden/bike-share/teams",
    "hooks_url": "https://api.github.com/repos/dannyradden/bike-share/hooks",
    "issue_events_url": "https://api.github.com/repos/dannyradden/bike-share/issues/events{/number}",
    "events_url": "https://api.github.com/repos/dannyradden/bike-share/events",
    "assignees_url": "https://api.github.com/repos/dannyradden/bike-share/assignees{/user}",
    "branches_url": "https://api.github.com/repos/dannyradden/bike-share/branches{/branch}",
    "tags_url": "https://api.github.com/repos/dannyradden/bike-share/tags",
    "blobs_url": "https://api.github.com/repos/dannyradden/bike-share/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/dannyradden/bike-share/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/dannyradden/bike-share/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/dannyradden/bike-share/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/dannyradden/bike-share/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/dannyradden/bike-share/languages",
    "stargazers_url": "https://api.github.com/repos/dannyradden/bike-share/stargazers",
    "contributors_url": "https://api.github.com/repos/dannyradden/bike-share/contributors",
    "subscribers_url": "https://api.github.com/repos/dannyradden/bike-share/subscribers",
    "subscription_url": "https://api.github.com/repos/dannyradden/bike-share/subscription",
    "commits_url": "https://api.github.com/repos/dannyradden/bike-share/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/dannyradden/bike-share/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/dannyradden/bike-share/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/dannyradden/bike-share/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/dannyradden/bike-share/contents/{+path}",
    "compare_url": "https://api.github.com/repos/dannyradden/bike-share/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/dannyradden/bike-share/merges",
    "archive_url": "https://api.github.com/repos/dannyradden/bike-share/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/dannyradden/bike-share/downloads",
    "issues_url": "https://api.github.com/repos/dannyradden/bike-share/issues{/number}",
    "pulls_url": "https://api.github.com/repos/dannyradden/bike-share/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/dannyradden/bike-share/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/dannyradden/bike-share/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/dannyradden/bike-share/labels{/name}",
    "releases_url": "https://api.github.com/repos/dannyradden/bike-share/releases{/id}",
    "deployments_url": "https://api.github.com/repos/dannyradden/bike-share/deployments",
    "created_at": "2017-03-16T21:21:05Z",
    "updated_at": "2017-03-23T17:44:53Z",
    "pushed_at": "2017-04-28T04:07:48Z",
    "git_url": "git://github.com/dannyradden/bike-share.git",
    "ssh_url": "git@github.com:dannyradden/bike-share.git",
    "clone_url": "https://github.com/dannyradden/bike-share.git",
    "svn_url": "https://github.com/dannyradden/bike-share",
    "homepage": nil,
    "size": 2566,
    "stargazers_count": 1,
    "watchers_count": 1,
    "language": "Ruby",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "forks_count": 1,
    "mirror_url": nil,
    "open_issues_count": 2,
    "forks": 1,
    "open_issues": 2,
    "watchers": 1,
    "default_branch": "master",
    "permissions": {
      "admin": false,
      "push": true,
      "pull": true
    }
  }
]
end