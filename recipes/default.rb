# Cookbook Name:: phabricator
# Recipe:: default

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

include_recipe "git"
include_recipe "php"
include_recipe "php::module_gd"
include_recipe "php::module_mysql"
include_recipe "php::module_curl"
include_recipe "php::module_ldap"
include_recipe "php::module_apc"
include_recipe "php-fpm"
include_recipe "runit"

include_recipe "phabricator::user"
include_recipe "phabricator::code"

include_recipe "phabricator::database"
include_recipe "phabricator::web"
include_recipe "phabricator::configure"
include_recipe "phabricator::service"
