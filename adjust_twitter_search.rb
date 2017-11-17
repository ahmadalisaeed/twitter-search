require 'sinatra/base'
require 'sinatra'
require_relative 'services/twitter_service'
require 'slim'

get '/' do
  slim :index
end

post '/search' do 
	text_to_search = params[:search]
	@tweets = []
	@tweets = TwitterService.search(text_to_search).take(10) unless text_to_search.empty?
	slim :index
end

class AdjustTwitterSearch < Sinatra::Base

  configure :development do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :production do
    set :raise_errors, false #false will show nicer error page
    set :show_exceptions, false #true will ignore raise_errors and display backtrace in browser
  end
end