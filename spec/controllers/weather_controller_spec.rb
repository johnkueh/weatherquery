require 'spec_helper'

describe WeatherController do

  describe "GET 'input'" do
    it "returns http success" do
      get 'input'
      response.should be_success
    end
  end

  describe "GET 'result'" do
    it "returns http success" do
      get 'result'
      response.should be_success
    end
  end

end
