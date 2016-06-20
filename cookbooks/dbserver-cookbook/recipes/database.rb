#
# Cookbook Name:: dbserver-cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

mysql_client 'default' do
  action :create  
end

mysql_service 'default' do
  bind_address node['mysql']['bind_address']
  initial_root_password node['mysql']['password']
  action [:create, :start]
end

execute 'grant root access to connect from anywhere' do
  command "mysql -S /run/mysql-default/mysqld.sock -u root -p#{node['mysql']['password']} -D mysql -r -B -N -e \"grant all privileges on *.* to 'root'@'%' identified by '#{node['mysql']['password']}'\""
end

cookbook_file '/home/vagrant/DONE-Capsule-DDLDML.sql' do
  source 'DONE-Capsule-DDLDML.sql'
  action :create
end

execute 'restore capsule db' do
  command "mysql -S /run/mysql-default/mysqld.sock -u root -p#{node['mysql']['password']} < /home/vagrant/DONE-Capsule-DDLDML.sql"
end

