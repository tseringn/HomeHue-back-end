require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest-client'
require 'base64'

class PhotosController < ApplicationController

    def create
        image_url = 'https://lh3.googleusercontent.com/XQw_cO6TXYf-tP7skTGMTJZfG-hDK7pjydXfh0sjkZBmhzv7vllPQE1WxvnaRV19hO-BfkhnBsvzvJzkbhpIB0Yd6-12DBCj7F8XHZ_IUwfgea8J6vr6DceRlHXnWiLFkw_Gt1-cEPIWP7dpEyyIM7G8ZwsslsPVmP9k1qbalyJiJI2e3-nrEzirr7exbzTeUnPFk7Ml7Eop_R0zE7xKwlZSartmkM-rblL8OqcKy32OcsFMUuYeTJWIEXFznrjZ15oBspxWldPc1XAkeQfR_2vEJYHxXx0zYbbloE_Wd7oCpaohPwpxrwLIvuyXemiwgaFBOmPtCuV4zcDR_fGYhcWGfSzrkaFI64wJ4GYhJGMfOORM_Lb110YUd4fWkOqMjm_v6AFPrE5Bl_sWiCg523no88ew0GopDKnyZ2ao1JxWyeepeF6_6Vh7dqeijMDD2mgUKBAWXAmQz52FnWNjHPosdVSqRBkhyQChJ7gPo6Ea4tQI254xpqGhtKBfO_y4to0btOs_O1pTV3PZK6eSSKODOlS4stwdx8Q_m1jQt9yziIfjFsYXMHDTj0DdIU2lNS_b1IqTAxaDjK4Vn2C2L5Y87bIu56XVFuLZESKjnjDymxHC81oN8I3SdWCBlPGnB_RDhh9XZInaBcDng5jyXWWKSbBm7gyHi2GWFhyFpO8Hag7ngsPldxI-KUjw9g=w567-h755-no?authuser=0'
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
