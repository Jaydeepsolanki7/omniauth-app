require 'open-uri'

class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    uid = auth_hash.uid
    @client = Client.find_or_create_by(uid: uid)

    if @client.present?
      begin
        image_url = auth_hash.info.image
        @client.profile.attach(io: URI.open(image_url), filename: 'avatar.jpg', content_type: 'image/jpeg')

        if @client.save
          session[:client_id] = @client.id
          redirect_to products_path
        else
          flash[:alert] = "Error creating or updating client"
          redirect_to root_path
        end
      rescue OpenURI::HTTPError => e
        flash[:alert] = "Error fetching avatar image: #{e.message}"
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def delete
    session[:client_id] = nil
    redirect_to root_path
  end
end
