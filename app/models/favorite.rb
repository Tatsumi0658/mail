class Favorite < ApplicationRecord
  belongs_to :Profile
  belongs_to :post
end
