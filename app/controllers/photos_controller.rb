
require "uri"
require "json"
require 'rest-client'
require 'base64'
class PhotosController < ApplicationController

    def create
            image_url = photo_params[:img_url]
            api_key = 'acc_ffc1bc4fd1a6a9c'
            api_secret = 'ee61eb72c1179f1b494b78ae6672a571'
      
            auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
            response = RestClient.get "https://api.imagga.com/v2/colors?image_url=#{image_url}", { :Authorization => auth }
            result = JSON.parse(response)
            colors={room_id: photo_params[:room_id], :img_url: photo_params[:img_url]}
            colorIndex=1

            result["result"]["colors"]["image_colors"].each do |color|
                colors["color#{colorIndex}"]= color['closest_palette_color_html_code']
                colorIndex +=1
                if(colorIndex>)
                    break
                end
                photo=Photo.create(colors)
                render json: photo
     end

        # Photo.create(img_url: photo_params[img_url], room_id: photo_params[room_id], color1 )

    end

    create

    private

    def photo_params
        params.require(:photo).permit(*args)
    end
    
end
