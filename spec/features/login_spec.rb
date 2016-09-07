require 'rails_helper'

feature 'Log in' do
  background do
    user = create(:user)
  end
  scenario 'user can log in' do
    visit '/'
    sign_in
    expect(page).to have_content "Signed in successfully."
  end
end
