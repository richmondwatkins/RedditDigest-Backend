desc "Morning Digest"
task :morning => :environment do
    puts "start."

  Device.new.morning_digest
  puts "done."
end

desc "Evening Digest"
task :evening => :environment do
    puts "start."

  Device.new.evening_digest
  puts "done."
end