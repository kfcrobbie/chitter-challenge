require 'spec_helper'
require 'sinatra'

def sign_up(email:'rob@example.com',
                name: 'Rob Morgan',
                username: 'Rob',
                password: 'pass'
                )
      visit '/sign_up'
      fill_in :email, with: email
      fill_in :name, with: name
      fill_in :username, with: username
      fill_in :password, with: password
      click_button 'Sign up'

    end
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
    expect(page).to have_content('Welcome to Chitter, Rob')
  end

  scenario 'I cannot sign up if my username has already been taken' do
    visit '/'
    click_link 'Sign up'
    sign_up
    visit '/'
    click_link 'Sign up'
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('That username is already taken!')
  end

end
