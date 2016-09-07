require 'rails_helper'

feature 'Log out' do
  background do
    user = create(:user)
    visit '/'
    sign_in
  end
  scenario 'user can signout' do
    click_link 'Sign out'
    expect(page).to have_content 'Signed out successfully'
  end
end
