Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user:email,user:follow,user:user,user:repo,user:gist"
end
