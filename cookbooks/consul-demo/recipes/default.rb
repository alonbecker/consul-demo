#
# Cookbook Name:: consul-demo
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#

include_recipe "apt"
include_recipe "consul"
include_recipe "consul::ui"
consul::consul_service_def 'jenkins' do
  port 8080 
  tags ['jenkins']
  check(
    interval: '10s',
    script: 'echo ok'
  )
  notifies :reload, 'service[consul]'
end
