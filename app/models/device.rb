class Device < ActiveRecord::Base

  def tester
    device = Device.find_or_create_by(:deviceid => params[:device])
    put '=================='
    puts device.deviceid  
    put '=================='

  end

end
