set :user, "freed"
set :rails_env, "production"
server "freed", :roles => %w(web app db), :primary => true, :user => "freed"
server "freed", :roles => %w(web app), :user => "freed"

set :linked_files, fetch(:linked_files, []).push(".env.production")
