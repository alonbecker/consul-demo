include_recipe "consul_kv"

consul_kv 'build_number' do
  path 'production/demo-service/build_number'
  value '0'
  consul_addr '127.0.0.1:8500'
end

consul_kv 'build_number' do
  path 'development/demo-service/build_number'
  value '0'
  consul_addr '127.0.0.1:8500'
end
