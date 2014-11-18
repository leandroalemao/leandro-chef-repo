name "web-server"
description "General rails web server"
run_list "recipe[web-apps]"

default_attributes "chef_client" => {"interval" => 60}
