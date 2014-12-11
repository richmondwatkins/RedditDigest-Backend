require 'time'
class Device < ActiveRecord::Base

has_many :subreddits
has_many :recommendations

  def morning_digest
    utc_time = Time.new.utc
    utc_hour = utc_time.hour

    if utc_hour  >= 18
        eight_am = 31
    else
      eight_am = 7
    end
    
    time_zone = eight_am - utc_hour
    puts time_zone
    devices = Device.where("time_zone = ?", time_zone)

      if devices.count > 0
        send_notifications(devices)
        else
        puts 'No devices were registerd in this timezone'
      end
  end

  def evening_digest
    utc_time = Time.new.utc
    utc_hour = utc_time.hour

    if utc_hour  >= 4
      six_pm = 17
    else
      six_pm = -8
    end
      
    time_zone = six_pm - utc_hour 
    puts time_zone
    devices = Device.where("time_zone = ?", time_zone)

      if devices.count > 0
        send_notifications(devices)
      else
        puts 'No devices were registerd in this timezone'
      end
  end


  def send_notifications(devices)
      ZeroPush.auth_token = "z3C5aT8qdyePAnD1eq9n"

      deviceTokens = []
      devices.each do |device|
       deviceTokens << device.device_token.to_s
     end

      notification = {
        device_tokens: deviceTokens,
        content_available: true,
        sound: "",
        badge: 0
      }

      puts notification
      ZeroPush.notify(notification) 
  end

end
