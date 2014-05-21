# Cookbook Name:: phabricator
# Recipe:: code

# Copyright (C) 2014  Sean Escriva


# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
