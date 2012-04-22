set :domain, '176.32.84.222'

set :application, "milk"
set :repository,  "git@github.com:t11a/milk.git"
set :deploy_to, "/var/www/#{application}"

set :scm, :git

role :web, domain

set :deploy_via, :remote_cache
set :branch, 'master'
set :scm_verbose, true
set :user_sudo, false
set :user, 'webmaster'
set :port, 10022
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace :deploy do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
