# encoding: utf-8
require 'sinatra'
require "sinatra/content_for"
require 'i18n'
require 'sinatra/support/i18nsupport'

configure do
	register Sinatra::I18nSupport
	I18n.enforce_available_locales = false
	load_locales './config/locales'
	set :default_locale, 'nb'
end


before '/:locale/*' do
  puts params[:locale]
  session[:locale] = params[:locale] if params[:locale]
  request.path_info = '/' + params[:splat ][0]
end

helpers do
  def current?(path='')
    request.path_info=='/'+path ? 'active':  nil
  end

  def locale_link
    puts session[:locale]
    puts settings.default_locale
    "/#{current_locale}/" if settings.default_locale == session[:locale]
  end
end

# Hack to prevent 404 on '/en'
get '/en' do
  redirect to '/en/'
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