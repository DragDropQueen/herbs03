require 'sinatra/base'


class HerbApp < Sinatra::Application
  get '/' do
    herb_table = DB[:herb]
    erb :index, :locals => {herbs: herb_table.to_a}
  end

  post '/' do
    herb_table = DB[:herb]
    herb_table.insert(name: params[:herb_name])
    redirect '/'
  end

end