#
# Cookbook Name:: dbserver-cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#include_recipe 'apt::default'
#include_recipe 'apiserver-cookbook::api'

cookbook_file '/home/vagrant/DONE-Capsule-DDLDML.sql' do
  source 'DONE-Capsule-DDLDML.sql'
  action :create
end


