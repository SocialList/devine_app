require 'rails_helper'

feature 'Signing up' do
  scenario 'user can signup' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Username', with: "Whatever"
    fill_in 'Email', with: "Whatever@email.com"
    fill_in 'Password', with: "secretsecret7"
    fill_in 'Password confirmation', with: "secretsecret7"
    click_button 'Sign up'
    expect(page).to have_content "Welcome!"
  end
end
