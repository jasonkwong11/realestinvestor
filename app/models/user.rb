class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.top_contributer
    user = limit(1).order('post_count desc')
    user[0].email
  end

  def self.top_contributer_count
    user = limit(1).order('post_count desc')
    user[0].post_count
  end

end