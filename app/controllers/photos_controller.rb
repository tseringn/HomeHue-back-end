

class PhotosController < ApplicationController

    def create
            image_url = 'https://i.ytimg.com/vi/dxAutV5azRU/hqdefault.jpg'
            api_key = 'acc_ffc1bc4fd1a6a9c'
            api_secret = 'ee61eb72c1179f1b494b78ae6672a571'
      
            auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
            response = RestClient.get "https://api.imagga.com/v2/colors?image_url=#{image_url}", { :Authorization => auth }
            puts response
     end

        # Photo.create(img_url: photo_params[img_url], room_id: photo_params[room_id], color1 )

    end

    create

    private

    def photo_params
        params.require(:photo).permit(:img_url, :room_id)
    end
    
end
