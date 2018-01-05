lock '3.10.1'

set :application, 'infumel'
set :repo_url, 'https://github.com/katao/infumel.git'

set :branch, 'master'
set :deploy_to, '/var/www/app/infumel'
set :scm, :git
set :log_level, :debug
set :pty, true

set :bundle_binstubs, nil
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}
set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do
    after :finishing, 'deploy:cleanup'
end
