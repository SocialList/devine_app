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

  scenario 'user can not see log in/sign up link when logged in' do
    visit '/'
    sign_in
    expect(page).not_to have_link 'Login'
    expect(page).not_to have_link 'Sign up'
  end
end
