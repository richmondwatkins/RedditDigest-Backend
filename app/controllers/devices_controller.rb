require 'zero_push'

class DevicesController < ApplicationController

  skip_before_action :verify_authenticity_token


  def create


    device = Device.find_or_create_by(:deviceToken => params[:device])

       puts 'THIS IS THE DEVICE TOKEN'
   puts device.deviceToken
   puts '======================'
      puts '======================'
   puts '======================'
   puts '======================'
   puts '======================'

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
      phone = Device.find_or_create_by(:phoneId => params[:phone])
     
    puts '==========================================='
        puts '==========================================='

      puts '==========================================='

    puts '==========================================='
        puts '==========================================='

      puts '==========================================='

     
    puts '==========================================='
        puts '==========================================='

      puts '==========================================='


      puts phone

    puts '==========================================='
        puts '==========================================='

      puts '==========================================='

     
    puts '==========================================='
        puts '==========================================='

      puts '==========================================='
     
    puts '==========================================='
        puts '==========================================='

      puts '==========================================='

 
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
