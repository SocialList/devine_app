def sign_up(user_name: "NewUser", email: "email@email.com", password: "secretsecret7")
  fill_in 'User name', with: user_name
  fill_in 'Email', with: email
  fill_in 'Password', with: password , :match => :prefer_exact
  fill_in 'Password confirmation', with: password , :match => :prefer_exact
  click_button 'Sign up'
end

def sign_in(email: "email@email.com", password: "secretsecret7")
  click_link 'Login'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end
