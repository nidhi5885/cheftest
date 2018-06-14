#
# Cookbook:: learn_chef_apache2
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

package 'httpd'

service 'httpd' do
  supports status: true
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end
