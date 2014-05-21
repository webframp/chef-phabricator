# Cookbook Name:: phabricator
# Recipe:: configure

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
phabricator_install = "#{node['phabricator']['directory']}/phabricator"

file "#{node['phabricator']['php_conf_d']}/apc.stat.ini" do
  content "apc.stat=0\n"
end

directory node['phabricator']['config']['repository.default-local-path'] do
  user node['nginx']['user']
  group node['nginx']['user']
end

file "#{phabricator_install}/conf/local/local.json" do
  owner install_user
  group install_user
  content lazy { JSON.pretty_generate(node['phabricator']['config']) }
end
