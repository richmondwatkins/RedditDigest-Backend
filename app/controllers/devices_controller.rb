require 'zero_push'

class DevicesController < ApplicationController

  skip_before_action :verify_authenticity_token


  def create
   
    device = Device.find_or_create_by(:deviceid => params[:device])
    puts device.deviceid

    ZeroPush.auth_token = "eZHW1pzRaYJHua6Egswr"

    notification = {
      device_tokens: [device.deviceid],
      alert: "Something really awesome just happened!!",
      sound: "default",
      badge: 1
    }

  ZeroPush.notify(notification) 

    # ZeroPush.notify({
    #   device_tokens: ["29224d44f430eb0bf81be597e6532e04efc7604596f28283a79c4abb4a8bdf64"],
    #   alert: "HEYOOOOOOO",
    #   sound: "default",
    #   badge: "3"
    # })

  end

  #  curl -i -d "auth_token=eZHW1pzRaYJHua6Egswr" \
  # -d "device_tokens[]=29224d44f430eb0bf81be597e6532e04efc7604596f28283a79c4abb4a8bdf64" \
  # -d "alert=How's your soup?" \
  # -d "badge=4" \
  # -d "sound=default" \
  # "https://api.zeropush.com/notify"


  private

  def device_params
      params.permit(:device)
  end


end
