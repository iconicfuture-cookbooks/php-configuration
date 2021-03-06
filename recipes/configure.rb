#
# Cookbook Name:: php-fpm
# Recipe:: fpm-configure
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# Overwrite existing /etc/php5/fpm/pool.d/www.conf with template one.
#
template "/etc/php5/fpm/pool.d/www.conf" do
    source "www.erb"
    owner "root"
    group "root"
    mode "0644"
end

#
# Overwrite existing /etc/php5/fpm/conf.d/apc.conf with template one.
#
template "#{node['php']['ext_conf_dir']}/apc.ini" do
  source "apc.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  only_if do
    "#{node['php']['packages']}".include? 'php-apc'
  end
end

#
# Workaround as the new PHP cookbook does not handle php5-fpm anymore,
# so there is no service registered that can be notified by template changes
#
execute "restart php5-fpm" do
  command "service php5-fpm restart"
  user "root"
  action :run
end
