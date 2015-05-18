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
    notifies :restart, "service[php5-fpm]"
end

#
# Overwrite existing /etc/php5/fpm/conf.d/apc.conf with template one.
#
template "#{node['php']['ext_conf_dir']}/apc.ini" do
  source "apc.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[php5-fpm]"
end
