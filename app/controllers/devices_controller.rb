require 'zero_push'

class DevicesController < ApplicationController

  skip_before_action :verify_authenticity_token


  def register_push
      phone_string = /\>(.*)/.match(params[:deviceid]).to_s.strip
    phone_string[0] = ''
    phone_string = phone_string.lstrip
 
    # device = Device.find_or_create_by(:deviceToken => params[:token])
    device = Device.find_by_phoneid(phone_string)
    device.deviceToken = params[:token]
    device.timeZone = params[:timeZone]
    device.save

    # ZeroPush.auth_token = "eZHW1pzRaYJHua6Egswr"

    # notification = {
    #   device_tokens: [device.deviceToken],
    #   content_available: true,
    #   sound: "",
    #   badge: 1
    # }

    # ZeroPush.notify(notification)

    respond_to do |format|
      msg = { :status => "ok", :message => "Success!"}
      format.json  { render :json => msg } # don't do msg.to_json
    end 
  end

  def register_device
    phone_string = /\>(.*)/.match(params[:deviceid]).to_s.strip
    phone_string[0] = ''
    phone_string = phone_string.lstrip

    phone = Device.find_or_create_by(:phoneid => phone_string)

    respond_to do |format|
       msg = { :status => "ok", :message => "Success!" }
      format.json  { render :json => msg } 
    end 
  end

  def add_subreddits
    phone_string = /\>(.*)/.match(params[:phoneid]).to_s.strip
    phone_string[0] = ''
    phone_string = phone_string.lstrip

    phone = Device.find_by_phoneid(phone_string)

    #TODO remove subreddits that have been removed from core data
    data = params["subreddits"]
    data.each do |subreddit|
      Subreddit.find_or_create_by(:subreddit => subreddit["subreddit"], :url =>subreddit["url"], :device_id => phone.id)
    end

    respond_to do |format|
      msg = { :status => "ok", :message => "Success!"}
      format.json  { render :json => msg } 
    end 
   end

   def get_subreddits
    phone_string = /\>(.*)/.match(params[:phoneid]).to_s.strip
    phone_string[0] = ''
    phone_string = phone_string.lstrip

    phone = Device.find_by_phoneid(phone_string)

    respond_to do |format|
      msg = { :subreddits => phone.subreddits }
      format.json  { render :json => msg } 
    end 
   end

   def destroy_subreddits
    phone_string = /\>(.*)/.match(params[:phoneid]).to_s.strip
    phone_string[0] = ''
    phone_string = phone_string.lstrip

    phone = Device.find_by_phoneid(phone_string)

    data = params["subreddit"]
    Subreddit.find_by_subreddit_and_device_id(data["name"], phone.id).destroy
    respond_to do |format|
      msg = { :subreddits => phone.subreddits }
      format.json  { render :json => msg } 
    end 
   end

  private

  def device_params
      params.permit(:device)
  end


end


