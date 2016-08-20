class Property < ActiveRecord::Base
  validates_presence_of :city, :condition

  has_one :post
end