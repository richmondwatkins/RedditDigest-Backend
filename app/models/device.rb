class Device < ActiveRecord::Base

  def tester
    # device = Device.find_or_create_by(:deviceid => "29224d44f430eb0bf81be597e6532e04efc7604596f28283a79c4abb4a8bdf65555")
     ZeroPush.auth_token = "eZHW1pzRaYJHua6Egswr"

      notification = {
        device_tokens: ["29224d44f430eb0bf81be597e6532e04efc7604596f28283a79c4abb4a8bdf64"],
        content_available: true,
        sound: "",
        badge: 3
      }

    ZeroPush.notify(notification) 
  end

end
