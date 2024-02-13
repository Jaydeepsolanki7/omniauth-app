class Client < ApplicationRecord
  has_one_attached :profile
  
  # def profile_url
  #   if profile.attached?
  #     host = Rails.application.routes.default_url_options[:host] || 'localhost:3000'
  #     url_for(profile, host: host)
  #   else
  #     # Assuming 'placeholder.jpg' is in the 'app/assets/images' directory
  #     ActionController::Base.helpers.asset_url('placeholder.jpg')
  #   end
  # end
end
