include_recipe "jenkins::java"
include_recipe "jenkins::master"

consul_service_def 'jenkins' do
  port 8080 
  tags ['jenkins']
  check(
    interval: '10s',
    script: 'echo ok'
  )
  notifies :reload, 'service[consul]'
end
