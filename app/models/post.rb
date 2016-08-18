class Post < ActiveRecord::Base
  has_many :comments
  has_many :users, through: :comments

  def properties_attributes=(properties_attributes)
    properties_attributes.each do |i, property_attributes|
      self.properties.build(property_attributes)
    end
  end
end