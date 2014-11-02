class Device < ActiveRecord::Base

  def tester
    device = Device.find_or_create_by(:deviceid => "29224d44f430eb0bf81be597e6532e04efc7604596f28283a79c4abb4a8bdf65555")
    puts '=================='
    puts device.deviceid  
    puts '=================='
  end

end
