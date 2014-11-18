#
# Cookbook Name:: web-apps
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

group "deployer" do
  action :create
end

# Deployer user, sudoer and with known RSA keys
include_recipe 'github-deploys'

execute "apt-get update" do
  command "apt-get update"
end

# OS Dendencies
%w(git ruby-dev build-essential libsqlite3-dev libssl-dev).each do |pkg|
  package pkg
end

# Install Ruby Version
include_recipe 'ruby_build'

ruby_build_ruby '2.1.5' do
    prefix_path '/usr/local/'
    environment 'CFLAGS' => '-g -O2'
    action :install
end

link "/usr/bin/ruby" do
  to "/usr/local/ruby/2.1.5/bin/ruby"
end

gem_package 'bundler' do
  options '--no-ri --no-rdoc'
end

# Install Rails Application
include_recipe "runit"
application 'basic_rails_app' do
  owner 'deployer'
  group 'deployer'
  path '/var/www/basic_rails_app'
  repository 'git@github.com:leandroalemao/basic_rails_app.git'
  rails do
    bundler true
    database do
      adapter "sqlite3"
      database "db/production.sqlite3"
    end
  end
  unicorn do
    worker_processes 2
  end
end
