class Post < ActiveRecord::Base
  has_many :comments
  has_many :users, through: :comments
  has_many :properties

  validates :title, presence: true, length: {minimum: 5}
  validates :content, presence: true,  length: {minimum: 100}

  def properties_attributes=(properties_attributes)
    properties_attributes.each do |i, property_attributes|
      self.properties.build(property_attributes)
    end
  end
end