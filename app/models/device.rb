require 'time'
class Device < ActiveRecord::Base

has_many :subreddits

  def tester
    utc_time = Time.new.utc
    utc_hour = utc_time.hour
    puts utc_hour

    if utc_hour  >= 18
        eight_am = 32
    else
      eight_am = 8
    end
    
    timeZone = eight_am - utc_hour

    devices = Device.where("timeZone = ?", -6)

      ZeroPush.auth_token = "z3C5aT8qdyePAnD1eq9n"

     devices.each do |device|
      deviceTokens = []
      deviceTokens << device.deviceToken.to_s

      notification = {
        device_tokens: deviceTokens,
        content_available: true,
        sound: "",
        badge: 1
      }

      puts notification
      ZeroPush.notify(notification) 
end
    # time = Time.new
    # hour = time.hour
    # utc_offset = Time.new.utc_offset / 60 / 60
    # puts hour
    # time_from_eight = 0

    # if hour > 8
    #    (1..hour).each do |i|
    #     hour -=1
    #     if hour == 8
    #       time_from_eight = i 
    #       break
    #     end
    #   end
    # end

    # if hour <= 8
    #   (hour + 1..8).each do |i|
    #     time_from_eight += 1
    #   end
    # end
     
    # puts 'utc timeeeee'
    # puts time.hour - utc_offset.abs
    # puts '==============='

    # puts 'time from eight'
    # puts time_from_eight
    # puts '==============='
    # difference = time_from_eight + utc_offset.abs

    # #when past 8 add to off set when before 8 subtract

    # puts difference 
    # difference = time_from_eight + utc_offset

    # eight_utc_offset = difference + utc_offset

    # puts eight_utc_offset

    # (utc_offset..time_from_eight).each do |i|
    #   puts i
    # end


    # device = Device.find_or_create_by(:deviceid => "29224d44f430eb0bf81be597e6532e04efc7604596f28283a79c4abb4a8bdf65555")
    # devices = Device.where("timeZone = ?", -6)
   

    #  end

    # #   notification = {
    # #     device_tokens: ["29224d44f430eb0bf81be597e6532e04efc7604596f28283a79c4abb4a8bdf64"],
    # #     content_available: true,
    # #     sound: "",
    # #     badge: 1
    # #   }

    # # ZeroPush.notify(notification) 
    # puts '============================='
    # puts '============================='
    # puts '============================='
    # puts '============================='
    # puts '============================='
    # puts '============================='
    # # puts deviceTokens[0]
    # #puts Time.zone_offset('CST')
    # puts '============================='
    # puts '============================='
    # puts '============================='
    # puts '============================='
    # puts '============================='

  end

end
