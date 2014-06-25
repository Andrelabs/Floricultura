rails_env = ENV['RAILS_ENV'] || 'development'

threads 4,4

bind  "unix:///data/apps/lojavirtual/shared/tmp/puma/lojavirtual-puma.sock"
pidfile "/data/apps/lojavirtual/current/tmp/puma/pid"
state_path "/data/apps/lojavirtual/current/tmp/puma/state"

activate_control_app