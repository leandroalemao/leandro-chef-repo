# See http://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "threetier"
client_key               "~/.ssh/threetier.pem"
validation_client_name   "threetierchef-validator"
validation_key           "~/.ssh/threetierchef-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/threetierchef"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks", "#{current_dir}/../my-cookbooks"]


knife[:aws_access_key_id] = ENV['THREE_TIER_CHEF_AWS_ACCESS_KEY_ID']
knife[:aws_secret_access_key] = ENV['THREE_TIER_CHEF_AWS_SECRET_ACCESS_KEY']
knife[:identity_file]         = "~/.ssh/three-tier-chef.pem"
knife[:region]                = "eu-west-1"
knife[:availability_zone]     = "eu-west-1a"
knife[:ssh_user]              = "ubuntu"
knife[:ssh_key]               = "three-tier-chef"
knife[:aws_ssh_key]           = "three-tier-chef"
knife[:aws_ssh_key_id]        = "three-tier-chef"


knife[:image]                 = "ami-f6b11181"
knife[:flavor]                = "m1.small"
