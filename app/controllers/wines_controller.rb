class WinesController < ApplicationController
    before_action :check_status
    def index
        @uploads = Wine.all
        @user = User.find(session[:user_id])
    end

    def create
      # Make an object in your bucket for your upload
        obj = S3_BUCKET.objects[params[:file].original_filename]

          # Upload the file
        obj.write(
            file: params[:file],
            acl: :public_read
        )

          # Create an object for the upload
        @upload = Wine.new(
            url: obj.public_url,
            name: obj.key,
            title: params[:title],
            location: params[:location]
            )

          # Save the upload
        if @upload.save
            redirect_to '/wines/index'
        else
            flash.now[:notice] = 'There was an error'
            render :new
        end
    end

    private

    def check_status
        if !session[:user_id]
            redirect_to '/'
        end
    end

end
