user_account = node['phabricator']['user']

user user_account do
  supports :manage_home => true
  home node['phabricator']['directory']
end

group user_account
