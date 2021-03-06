#!/usr/bin/env puma

directory '/usr/app'
rackup "/usr/app/config.ru"
environment 'production'

tag ''

pidfile "/usr/app/tmp/pids/puma.pid"
state_path "/usr/app/tmp/pids/puma.state"
stdout_redirect '/usr/app/log/puma.error.log', '/usr/app/log/puma.access.log', true

threads 2,4

bind '127.0.0.1:5555'

workers 0

preload_app!

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
