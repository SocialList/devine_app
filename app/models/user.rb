class User < ActiveRecord::Base
  has_one :github_profile
  validates :user_name, presence: true, length: { minimum: 4, maximum: 50 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def self.create_with_omniauth(auth)
    new_user = create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.user_name = auth['info']['name']
      user.email = auth['info']['email']
      user.password = SecureRandom.urlsafe_base64
    end
    new_user.create_github_profile auth

    new_user
  end

  def create_github_profile auth
    GithubProfile.create({user_id: id, nickname: auth[:info][:nickname]||"",
      email: auth[:info][:email]||"", name: auth[:info][:name]||"",
      image: auth[:info][:image]||"",
      location: auth[:extra][:raw_info][:location]||"",
      public_repo: auth[:extra][:raw_info][:public_repos]||"",
      public_gists: auth[:extra][:raw_info][:public_gists]||"",
      followers: auth[:extra][:raw_info][:followers]||"",
      following: auth[:extra][:raw_info][:following]||"",
      member_since: auth[:extra][:raw_info][:created_at]||"",
      access_token: auth[:credentials][:token]})
  end
end
