require 'spec_helper'

describe Weather do

	describe "zipcode validations" do

	  before do
	    @weather = Weather.new(:zipcode => "12345")
	  end

	  subject { @weather }

	  it { should respond_to(:zipcode) }
	  it { should be_valid }

	  describe "when zipcode is not present" do
	    before { @weather.zipcode = " " }
	    it { should_not be_valid }
	  end

	  describe "when zipcode is not a number" do
	    before { @weather.zipcode = "abc" }
	    it { should_not be_valid }
	  end

	  describe "when zipcode is too long" do
	    before { @weather.zipcode = "1" * 51 }
	    it { should_not be_valid }
	  end

	  describe "when zipcode is too short" do
	    before { @weather.zipcode = "1" * 3 }
	    it { should_not be_valid }
	  end

	end

  describe "response when zipcode is found" do

  	before do
  	  @response = Weather.query(94111)["current_observation"]
  	end

  	it "should include city_name" do
  		@response["display_location"]['city'].should be_present
  	end

  	it "should include state_name" do
  		@response["display_location"]['state_name'].should be_present
  	end

  	it "should include current_temperature as fahrenheit" do
  		@response['temp_f'].should be_present
  	end

  end

  describe "response when zipcode is not found" do

  	before do
	  	@response = Weather.query(88888)['response']
	  end

	  it "should return an error description when zipcode is not found" do
	  	@response['error']['description'].should be_present
	  end

  end
end