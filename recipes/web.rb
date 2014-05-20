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

phabricator_dir = "#{node['phabricator']['directory']}/phabricator"

include_recipe "nginx"

#directory "/etc/nginx/sites-available"
#directory "/etc/nginx/sites-enabled"

service "nginx" do
    action [:enable]
end

template "/etc/nginx/sites-available/phabricator" do
    source "nginx.erb"
    variables ({ :phabricator_dir => phabricator_dir })
    mode 0644
    notifies :reload, "service[nginx]"
end

service "php-fpm" do
  action :restart
end

nginx_site "phabricator" do
  action :enable
end
