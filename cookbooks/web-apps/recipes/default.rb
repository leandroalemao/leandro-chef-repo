#
# Cookbook Name:: web-apps
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user "web" do
  action :create
end

group "web" do
  members ["web", "ubuntu"]
  action :create
end

directory "/var/www" do
  owner 'web'
  group 'web'
  mode '0644'
  action :create
end
