class Authorization < ActiveRecord::Base

  belongs_to :user

	after_create :fetch_details

  def self.find_with_omniauth(auth)
    find_by(uid: auth['uid'], provider: auth['provider'])
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], provider: auth['provider'])
  end

	def fetch_details
		self.send("fetch_details_from_#{self.provider.downcase}")
	end

	# example
  # def fetch_details_from_facebook
	# 	graph = Koala::Facebook::API.new(self.token)
	# 	facebook_data = graph.get_object("me")
	# 	self.username = facebook_data['username']
	# 	self.save
	# end

	def fetch_details_from_github
	end

end
