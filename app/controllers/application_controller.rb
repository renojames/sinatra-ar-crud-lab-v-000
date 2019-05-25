
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    #binding.pry
    @article = Article.find_by(params[:id])
    #binding.pry
    erb :show
  end

  post '/articles' do
    Article.create(params)
    @articles = Article.all
    erb :index
  end

end
