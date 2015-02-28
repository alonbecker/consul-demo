consul_key_watch_def 'build_number' do
  key "/production/demo-service"
  handler "/usr/bin/start"
end
