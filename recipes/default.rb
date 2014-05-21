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
include_recipe "phabricator::setup"
include_recipe "phabricator::web"
