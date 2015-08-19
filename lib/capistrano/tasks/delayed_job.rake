namespace :delayed_job do
  desc "Start delayed_job process"
  task :start do
    on roles(:app) do
      within current_path do
        hostname = capture("hostname").strip
        execute :bundle, "exec", "script/delayed_job", "--queues=default,#{hostname}", "-n 2", "start"
      end
    end
  end

  desc "Stop delayed_job process"
  task :stop do
    on roles(:app) do
      within current_path do
        execute :bundle, "exec", "script/delayed_job", "stop"
      end
    end
  end

  desc "Restart delayed_job process"
  task :restart do
    on roles(:app) do
      find_and_execute_task("delayed_job:stop")
      find_and_execute_task("delayed_job:start")
    end
  end

  task :kill do
    on roles(:app) do
      procs = capture("ps -A -o pid,command").split(/\r\n|\r|\n/).grep(/delayed_job/).map(&:to_i)

      if procs.any?
        execute "for i in #{procs.join(' ')} ; do kill -s TERM $i ; done"
      end
    end
  end
end