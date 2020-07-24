require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest-client'
require 'base64'

class PhotosController < ApplicationController

    def create
        image_url = 'https://i.ytimg.com/vi/dxAutV5azRU/hqdefault.jpg'
        api_key = 'acc_81ff1e078ba035c'
        api_secret = '16b40a226339a96959101666022620f0'

        auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
        response = RestClient.get "https://api.imagga.com/v2/colors?image_url=#{image_url}", { :Authorization => auth }
        puts response

        # Photo.create(img_url: photo_params[img_url], room_id: photo_params[room_id], color1 )

    end

    create

    private

    def photo_params
        params.require(:photo).permit(:img_url, :room_id)
    end
    
end
