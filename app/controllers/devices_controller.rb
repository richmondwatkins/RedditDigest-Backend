require 'zero_push'

class DevicesController < ApplicationController

  skip_before_action :verify_authenticity_token


  def register_push
    
    # device = Device.find_or_create_by(:deviceToken => params[:token])
    device = Device.find_by_phoneid(params[:deviceid])
    device.device_token = params[:token]
    device.time_zone = params[:timeZone]
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
   
    phone = Device.find_or_create_by(:phoneid => params[:deviceid])

    respond_to do |format|
       msg = { :status => "ok", :message => "Success!" }
      format.json  { render :json => msg } 
    end 
  end

  def add_subreddits

    phone = Device.find_by_phoneid(params[:phoneid])

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
 
    phone = Device.find_by_phoneid(params[:phoneid])

    respond_to do |format|
      msg = { :subreddits => phone.subreddits }
      format.json  { render :json => msg } 
    end 
   end

   def destroy_subreddits

    phone = Device.find_by_phoneid(params[:phoneid])

    data = params["subreddit"]

    Subreddit.find_by_subreddit_and_device_id(data["name"], phone.id).destroy
    respond_to do |format|
      msg = { :subreddits => phone.subreddits }
      format.json  { render :json => msg } 
    end 
   end


   def recommend_subreddit
    current_user = Device.find_by_phoneid(params[:phoneid])

    recommendations = []
    Device.find_each do |device|
      recommendations << find_similar_subreddits(device, current_user)
    end

    recommendations = recommendations.flatten

    recommendationNames = []

    recommendations.each do |rec|
      recommendationNames << rec
    end

    respond_to do |format|
      msg = { :status => "ok", :recs => recommendations}
      format.json  { render :json => msg } 
    end 
   end


   def find_similar_subreddits(device, current_user)
    current_user_subreddits = current_user.subreddits

    similarities = []

    device.subreddits.each do |subreddit|
      current_user_subreddits.each do |current_sub|
        if current_sub.subreddit == subreddit.subreddit
          similarities << subreddit
        end
      end
    end

    if similarities.count >= 2
      look_for_differences(device.subreddits, current_user_subreddits)
    end
  end


  def look_for_differences(device_subs, current_user_subreddits)
    differences, current_user_sub_strings = find_differnces(device_subs, current_user_subreddits)
  
    recommendations = []
    differences.each do |difference|
      present = current_user_sub_strings.include?(difference)
      if present == false
        recommendations << difference
        puts difference
      end
    end
    recommendations
  end

  def find_differnces(device, current_user)
    device_sub_strings = []

    device.each do |sub|
      device_sub_strings << sub.subreddit
    end

    current_user_sub_strings = []
    current_user.each do |sub|
      current_user_sub_strings << sub.subreddit
    end

   return (device_sub_strings - current_user_sub_strings), current_user_sub_strings
  end

  private

  def device_params
      params.permit(:device)
  end

end


