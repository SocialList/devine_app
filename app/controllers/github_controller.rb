class GithubController < ApplicationController
  def index
    client = Octokit::Client.new(:access_token => current_user.github_profile.access_token)
    @repositories = client.repos
  end
end
