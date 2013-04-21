class WeatherController < ApplicationController
  def index
  	@weather = Weather.new
  end

  def not_found
  end

  def query
  	@weather = Weather.new(params[:weather])
		if @weather.valid?
			@response = Weather.query(@weather.zipcode)
			if @response['current_observation']
				@current_observation = @response['current_observation']

				@zip_code = @weather.zipcode
				@full_name = @current_observation['display_location']['full']
				@city_name = @current_observation['display_location']['city']
				@state_name = @current_observation['display_location']['state_name']
				@temp = @current_observation['temp_f']
			else
				render :action => 'not_found'
			end
		else
			render :action => 'index'
		end
  end
end
