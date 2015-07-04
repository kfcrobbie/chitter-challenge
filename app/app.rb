require 'sinatra/base'
# require './app/data_mapper_setup'


class Chitter < Sinatra::Base

  get '/' do
    erb :'/users/welcome_page'
  end

  get '/sign_up' do
    erb :'/users/sign_up'
  end
  
  post '/users/new' do
    @user = User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    erb :'users/new'
  end




end