#
# Cookbook Name:: dbserver-cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

cookbook_file '/home/vagrant/eureka.jar' do
  source 'eureka.jar'
  action :create
end
