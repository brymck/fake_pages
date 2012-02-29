#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

FakePages::Application.load_tasks

def host_file_path
  File.join(ENV["SystemRoot"], "system32", "drivers", "etc", "hosts")
end

desc "Edit host file to redirect finance feeds here"
task :setup do
  begin
    File.open(host_file_path, "a") do |file|
      file.puts "127.0.0.1	bloomberg.com"
      file.puts "127.0.0.1	www.bloomberg.com"
      file.puts "127.0.0.1	google.com"
      file.puts "127.0.0.1	www.google.com"
      file.puts "127.0.0.1	finance.yahoo.com"
    end
    puts "Quote service URLs added to Windows hosts file."
  rescue
    puts "Unable to write to file. Make sure you have admin rights."
  end
end

desc "Edit host file to allow normal functioning"
task :teardown do
  begin
    lines = File.read(host_file_path).lines.map(&:dup)
    lines.reject! { |l| l =~ /bloomberg|yahoo|google/ }

    File.open(host_file_path, "w") do |file|
      lines.each do |line|
        file.puts line
      end
    end
    puts "Quote service URLs removed from Windows hosts file."
  rescue
    puts "Unable to write to file. Make sure you have admin rights."
  end
end
