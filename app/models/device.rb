require 'time'
class Device < ActiveRecord::Base

has_many :subreddits

  def tester
    # device = Device.find_or_create_by(:deviceid => "29224d44f430eb0bf81be597e6532e04efc7604596f28283a79c4abb4a8bdf65555")
    devices = Device.where("timeZone = ?", -6)
     ZeroPush.auth_token = "eZHW1pzRaYJHua6Egswr"

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

    #   notification = {
    #     device_tokens: ["29224d44f430eb0bf81be597e6532e04efc7604596f28283a79c4abb4a8bdf64"],
    #     content_available: true,
    #     sound: "",
    #     badge: 1
    #   }

    # ZeroPush.notify(notification) 
    puts '============================='
    puts '============================='
    puts '============================='
    puts '============================='
    puts '============================='
    puts '============================='
    # puts deviceTokens[0]
    #puts Time.zone_offset('CST')
    puts '============================='
    puts '============================='
    puts '============================='
    puts '============================='
    puts '============================='

  end

end
