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

  end

  private

  def device_params
      params.permit(:device)
  end


end
