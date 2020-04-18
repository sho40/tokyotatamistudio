class Purchase < ApplicationRecord
  has_one :cart, dependent: :destroy
  belongs_to :customer
end
