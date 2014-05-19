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

install_user= node['phabricator']['user']
phabricator_dir = "#{node['phabricator']['directory']}/phabricator"

file "#{phabricator_dir}/conf/local/local.json" do
  content node['phabricator']['config'].to_json
end

bash "Upgrade Phabricator storage" do
    user install_user
    cwd phabricator_dir
    code "./bin/storage upgrade --force"
end

# FIX none of this junk is can be run more than once
# # Install custom script to easily install an admin user
# template "Create admin script" do
#     path "#{phabricator_dir}/scripts/user/admin.php"
#     source "account.erb"
#     user install_user
#     mode 0755
# end

# bash "Install admin account" do
#     user install_user
#     cwd "#{phabricator_dir}/scripts/user"
#     code "./admin.php"
# end

# file "Remove admin script" do
#     path "#{phabricator_dir}/scripts/user/admin.php"
#     action :delete
# end
