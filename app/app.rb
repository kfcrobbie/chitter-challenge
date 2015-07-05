require 'sinatra/base'
require './app/data_mapper_setup'
require 'sinatra/flash'
require 'sinatra'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  get '/' do
    erb :'/users/welcome_page'
  end

  get '/sign_up' do
    erb :'/users/sign_up'
  end

  post '/users/new' do
    @user = User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user_id
      erb :'users/new'
    else flash[:errors] = @user.errors.full_messages
      redirect '/sign_up'
    end
  end
end
