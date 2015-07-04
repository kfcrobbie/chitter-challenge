require 'spec_helper'

feature 'User sign up' do
  scenario 'I am greeted with a welcome page' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter!')
  end
  
  scenario 'I am taken to the sign up page when trying to sign up' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_content('Please enter your details below to sign up to Chitter')
  end
  
  scenario 'I can be signed in when entering a name, email, username and password' do
    visit '/'
    click_link 'Sign up'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chiter, {#username}')
  end
  
  def sign_up(email:'rob@example.com',
    name: 'Rob Morgan',
    username: 'Rob',
    password: 'pass',
    password_confirmation: 'pass'
    )
    visit '/sign_up'
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  
  end
    
    
    
    
end
