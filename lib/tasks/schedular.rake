desc "This task is called by the Heroku scheduler add-on"
task :cronjob => :environment do
    puts "start."

  Device.new.tester
  puts "done."
end
