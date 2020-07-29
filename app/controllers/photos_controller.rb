
require "uri"
require "json"
require 'rest-client'
require 'base64'
class PhotosController < ApplicationController

    def create
            image_url = photo_params[:img_url]
            
            api_key = 'acc_81ff1e078ba035c'
            api_secret = '16b40a226339a96959101666022620f0'
      
            auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
            byebug
            response = RestClient.get "https://api.imagga.com/v2/colors?image_url=#{image_url}", { :Authorization => auth }
            result = JSON.parse(response)
            pic={room_id: photo_params[:room_id], img_url: photo_params[:img_url]}

            colorIndex=1

            result["result"]["colors"]["image_colors"].each do |color|
                pic["color#{colorIndex}"]= color['closest_palette_color_html_code']
                colorIndex +=1
                if(colorIndex>3)
                    break
                end
                  
            end
            
            photo=Photo.create(pic)
            render json: photo
       
    end

    

    private

    def photo_params
        params.require(:photo).permit(:room_id, :img_url)
    end
    
end
