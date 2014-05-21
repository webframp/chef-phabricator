# Cookbook Name:: phabricator
# Recipe:: database

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

include_recipe "mysql::client"

node.set['phabricator']['config']['mysql.pass'] = node['mysql']['server_root_password']

mysql_service node['mysql']['service_name'] do
  port node['mysql']['port']
  data_dir node['mysql']['data_dir']
  server_root_password node['mysql']['server_root_password']
  server_debian_password node['mysql']['server_debian_password']
  server_repl_password node['mysql']['server_repl_password']
  allow_remote_root node['mysql']['allow_remote_root']
  remove_anonymous_users node['mysql']['remove_anonymous_users']
  remove_test_database node['mysql']['remove_test_database']
  root_network_acl node['mysql']['root_network_acl']
  action :create
end

service "mysql" do
  action :nothing
end

file "#{node['phabricator']['mysql_conf_d']}/strict_all_tables.cnf" do
  content "[mysqld]\nsql_mode=STRICT_ALL_TABLES\n"
  notifies :restart, "service[mysql]", :delayed
end

mysql_user = node['phabricator']['db_user']
mysql_pass = node['mysql']['server_root_password']

bash "Upgrade Phabricator storage" do
  cwd "#{node['phabricator']['directory']}/phabricator"
  code "./bin/storage upgrade --force --user #{mysql_user} --password #{mysql_pass}"
end
