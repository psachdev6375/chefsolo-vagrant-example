#
# Cookbook Name:: dbserver-cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template '/etc/init/baseservice.conf' do
  source 'baseservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

template '/etc/init/eurekaservice.conf' do
  source 'eurekaservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

template '/etc/init/orderservice.conf' do
  source 'orderservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

template '/etc/init/pizzaservice.conf' do
  source 'pizzaservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

template '/etc/init/toppingservice.conf' do
  source 'toppingservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

template '/etc/init/zuulservice.conf' do
  source 'zuulservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

cookbook_file '/home/vagrant/eureka.jar' do
  source 'eureka.jar'
  action :create
end

cookbook_file '/home/vagrant/zuul-proxy-1.0.jar' do
  source 'zuul-proxy-1.0.jar'
  action :create
end

cookbook_file '/home/vagrant/BaseService-Demo.jar' do
  source 'BaseService-Demo.jar'
  action :create
end

cookbook_file '/home/vagrant/PizzaService-Demo.jar' do
  source 'PizzaService-Demo.jar'
  action :create
end

cookbook_file '/home/vagrant/ToppingService-Demo.jar' do
  source 'ToppingService-Demo.jar'
  action :create
end

cookbook_file '/home/vagrant/OrderService-Demo.jar' do
  source 'OrderService-Demo.jar'
  action :create
end

service 'eurekaservice' do
  action :start
end

service 'baseservice' do 
  action :start
end 

service 'toppingservice' do 
  action :start 
end 

service 'pizzaservice' do 
  action :start 
end 

service 'orderservice' do 
  action :start 
end 

service 'zuulservice' do 
  action :start 
end 

