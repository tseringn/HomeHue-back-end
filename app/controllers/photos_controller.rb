
require "uri"
require "json"
require 'rest-client'
require 'base64'
class PhotosController < ApplicationController

    def index
    photos=Photo.all
    render json: photo
    end

    def create
            image_url = photo_params['img_url']
            colorIndex=1
           
           getColors(image_url)["result"]["colors"]["image_colors"].each do |color|
               photo_params["color#{colorIndex}"]= color['closest_palette_color_html_code']
                colorIndex +=1
                if(colorIndex>3)
                    break
                end
                
             end
             
             photo=Photo.create(photo_params)
                render json: photo

        # Photo.create(img_url: photo_params[img_url], room_id: photo_params[room_id], color1 )
         
    end

 

    private

    def photo_params
        params.require(:photo).permit(:img_url, :room_id, :color1,  :color2, :color3)
    end

    def getColors(image_url)
        api_key = 'acc_ffc1bc4fd1a6a9c'
            api_secret = 'ee61eb72c1179f1b494b78ae6672a571'
            auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
            response = RestClient.get "https://api.imagga.com/v2/colors?image_url=#{image_url}", { :Authorization => auth, :accept => 'json'}
            
            result = JSON.parse(response)

    end
    
end
