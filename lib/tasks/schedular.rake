desc "This task is called by the Heroku scheduler add-on"
task :test => :environment do
  Device.test
  puts "done."
end
