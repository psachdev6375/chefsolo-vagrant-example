#
# Cookbook Name:: dbserver-cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'apt::default'
include_recipe 'dbserver-cookbook::database'

