user_account = node['phabricator']['user']
install_dir = node['phabricator']['directory']

repos = %w{phabricator libphutil arcanist}
repos.each do |repo|
  git "#{install_dir}/#{repo}" do
    user user_account
    group user_account
    repository "http://github.com/facebook/#{repo}"
    reference "master"
    action :checkout
  end
end
