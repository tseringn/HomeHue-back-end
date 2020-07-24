

require 'net/http'
require 'open-uri'
require 'json'

class Photo < ApplicationRecord
  belongs_to :room
  def self.get_api
      image_url = 'https://i.ytimg.com/vi/dxAutV5azRU/hqdefault.jpg'
      
      api_key = 'acc_ffc1bc4fd1a6a9c'
      api_secret = 'ee61eb72c1179f1b494b78ae6672a571'

      auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
      response = RestClient.get "https://api.imagga.com/v2/colors?image_url=#{image_url}", { :Authorization => auth }
      puts response
  end

end
