#
## Cookbook Name:: phabricator
## Recipe:: default
##
## Copyright 2013, Siphoc
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is furnished
## to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
## THE SOFTWARE.
##

# setup order:
# install (local user and clone code)
# database (sql server and storage update)
# config (phab config and storage update?)
# web (nginx)
# phabricator admin user
# phabricator ldap auth (?)

include_recipe "git"
include_recipe "php"
include_recipe "php-fpm"

local_account= node['phabricator']['user']
install_dir = node['phabricator']['directory']
phabricator_dir = "#{install_dir}/phabricator"

user local_account do
  supports :manage_home => true
  home install_dir
end

group local_account

repos = %w{phabricator libphutil arcanist}
repos.each do |repo|
  git "#{install_dir}/#{repo}" do
    user local_account
    group local_account
    repository "http://github.com/facebook/#{repo}"
    reference "master"
    action :checkout
  end
end

#include_recipe "phabricator::database"

file "#{phabricator_dir}/conf/local/local.json" do
  content node['phabricator']['config'].to_json
end
