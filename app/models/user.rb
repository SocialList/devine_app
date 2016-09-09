class User < ActiveRecord::Base

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.user_name = auth['info']['name']
      user.email = auth['info']['email']
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def mailboxer_name
    # user.user_name = auth['info']['name']
    self.user_name
  end



end
