class Product < ApplicationRecord
	validates :name, :price, presence: true
	has_one_attached :image

  # def image_url
  #   if image.attached?
  #     host = Rails.application.routes.default_url_options[:host] || 'localhost:3000'
  #     url_for(image, host: host)
  #   else
  #     # 4000000000009995 stripe invalid 
  #     ActionController::Base.helpers.asset_url('placeholder.jpg')
  #   end
  # end
end
