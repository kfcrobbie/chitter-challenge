require 'sinatra/base'
require './app/data_mapper_setup'


class Chitter < Sinatra::Base

  get '/' do
    erb :'/users/welcome_page'
  end

  get '/sign_up' do
    erb :'/users/sign_up'
  end




end