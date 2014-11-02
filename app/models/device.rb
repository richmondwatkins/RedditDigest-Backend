class Device < ActiveRecord::Base

  def test
    device = Device.find_or_create_by(:deviceid => "WORKED WORKED")
  end

end
