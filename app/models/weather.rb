require 'open-uri'
require 'json'

class Weather
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

  attr_accessor :zipcode

  validates_presence_of :zipcode
  validates_numericality_of :zipcode
  validates_length_of :zipcode, :minimum => 5, :maximum => 5

	def initialize(attributes = {})
		attributes.each do |name, value|
			send("#{name}=", value)
		end
	end

	def persisted?
		false
	end

  def self.query(zipcode)
  	result = JSON.parse(open("http://api.wunderground.com/api/ed044d75b91fb500/conditions/q/#{zipcode}.json").read)
  	return result
  end
end
