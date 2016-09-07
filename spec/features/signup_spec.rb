require 'rails_helper'

feature 'Signing up' do
  scenario 'user can signup' do
    visit '/'
    click_link 'Sign up'
    sign_up
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end
