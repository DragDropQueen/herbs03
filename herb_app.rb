require 'sinatra/base'


class HerbApp < Sinatra::Application
  get '/' do
    herb_table = DB[:herb]
    erb :index, :locals => {herbs: herb_table.to_a}
  end

  post '/' do
    herb_table = DB[:herb]
    herb_table.insert(name: params[:herb_name], part: params[:herb_part])
    redirect '/'
  end

  get '/update/:herb_id' do
    herb_table = DB[:herb]
    herb = herb_table.where(id: params[:herb_id])
    erb :update, :locals => {herb_id: params[:herb_id], herb: herb}
  end

  post '/update/:herb_id' do
    herb_table = DB[:herb]
    herb_table.where(id: params[:herb_id]).update(name: params[:herb_name], part: params[:herb_part])
    redirect '/'
  end

end