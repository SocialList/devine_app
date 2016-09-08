# require 'rails_helper'
#
# feature 'Github' do
#   scenario 'user signs in with Github' do
#     visit '/'
#     click_link 'Sign in with Github'
#     fill_in "Username or email address", with: "gfabrizi@gmail.com"
#     fill_in "Password", with: ENV["GITHUB_PASSWORD"]
#     click_button "Sign In"
#     expect(current_path).to eq(root_path)
#     expect(page).to have_content('Signed in!')
#   end
# end
