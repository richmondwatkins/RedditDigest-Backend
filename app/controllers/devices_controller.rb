require 'zero_push'

class DevicesController < ApplicationController

  skip_before_action :verify_authenticity_token


  def create

    device = Device.find_or_create_by(:deviceToken => params[:device])

    ZeroPush.auth_token = "eZHW1pzRaYJHua6Egswr"

    notification = {
      device_tokens: [device.deviceToken],
      content_available: true,
      sound: "",
      badge: 1
    }

    ZeroPush.notify(notification)

    respond_to do |format|
      msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
      format.json  { render :json => msg } # don't do msg.to_json
    end 
  end

  def add_phone
      phone = Device.find_or_create_by(:phoneid => params[:phone])
      respond_to do |format|
      msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
      format.json  { render :json => msg } # don't do msg.to_json
    end 
  end

  def add_subreddits
    phone = Device.where(["phoneid = ?", params[:phoneid]])

    puts '==============================='

    puts '==============================='
    puts '==============================='
    puts '==============================='
    puts '==============================='

    puts 'THIS IS THE PHONEEEEEEEE'
    puts phone
    puts '==============================='
    puts '==============================='
    puts '==============================='



    puts '==============================='
    puts '==============================='
    puts '==============================='

    puts '==============================='
     puts request.body["subreddits"]  
    puts '==============================='
    puts '==============================='
    puts '==============================='
    puts '==============================='
    puts '==============================='
    puts '==============================='
    puts '==============================='
    respond_to do |format|
      msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
      format.json  { render :json => msg } # don't do msg.to_json
    end 
   end

  private

  def device_params
      params.permit(:device)
  end


end
