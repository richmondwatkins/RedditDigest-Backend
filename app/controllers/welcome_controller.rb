class WelcomeController < ApplicationController

   skip_before_action :verify_authenticity_token


  def index
  end

  def create
    puts 'MADE it ==========================='

    puts 'MADE it ==========================='

    puts 'MADE it ==========================='

    puts 'MADE it ==========================='

    puts 'MADE it ==========================='

    puts 'MADE it ==========================='

    puts 'MADE it ==========================='
    puts 'MADE it ==========================='

    puts 'MADE it ==========================='

    @device = Device.find_or_create_by(:deviceid => params[:device])
    puts 'SAVEDDDD  #{@device}'
    puts 'SAVEDDDD  #{@device}'
    puts 'SAVEDDDD  #{@device}'
    puts 'SAVEDDDD  #{@device}'
    puts 'SAVEDDDD  #{@device}'
    puts 'SAVEDDDD  #{@device}'
    puts 'SAVEDDDD  #{@device}'
    puts 'SAVEDDDD  #{@device}'
    puts 'SAVEDDDD  #{@device}'
  end


  private

  def device_params
      params.permit(:device)
  end

end
