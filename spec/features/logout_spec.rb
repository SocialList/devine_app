require 'rails_helper'

feature 'Log out' do
  background do
    user = create(:user)
    visit '/'
  end
  scenario 'user can signout' do
    sign_in
    click_link 'Sign out'
    expect(page).to have_content 'Signed out successfully'
  end
end
