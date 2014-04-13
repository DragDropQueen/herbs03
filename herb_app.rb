require 'sinatra/base'


class HerbApp < Sinatra::Application
  get '/' do
    erb :index
  end

  post '/' do
    params[:herb_name]
  end

end