class Tip < ApplicationRecord
  belongs_to :post, optional: true
end
