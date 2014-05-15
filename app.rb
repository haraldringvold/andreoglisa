# encoding: utf-8

require 'sinatra'

helpers do
  def current?(path='')
    request.path_info=='/'+path ? 'active':  nil
  end
end

get '/' do
  erb :index
end

get '/svar' do
	erb :svar
end

get '/onskeliste' do
	erb :onskeliste
end

get '/info' do
	erb :info
end