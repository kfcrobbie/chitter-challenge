require 'spec_helper'
require 'sinatra'

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
  
  scenario 'I can be signed up when entering a name, email, username and password' do
    visit '/'
    click_link 'Sign up'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chiter, {#username}')
  end
  
  scenario 'I cannot sign up if my username has already been taken' do
  visit '/'
  click_link 'Sign up'
  sign_up
  visit '/'
  click_link 'Sign up'
  expect { sign_up }.to change(User, :count).by(0)
  expect(page).to have_content('Username already taken!')
end

  scenario 'I cannot sign up if my password and password confirmation do not match' do
    visit '/'
    click_link 'Sign up'
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/sign_up')
    expect(page).to have_content 'Password and confirmation password'
  
    
  
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
