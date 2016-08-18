class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :commenter, presence: true
  validates :content, presence: true,  length: {minimum: 5}

end