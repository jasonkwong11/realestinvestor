class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.top_contributer
    user = limit(1).order('post_count desc')
    user[0].email
  end

  def self.top_contributer_count
    user = limit(1).order('post_count desc')
    user[0].post_count
  end

end