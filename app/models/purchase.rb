class Purchase < ApplicationRecord
  has_one :cart
  has_one :customer
end
