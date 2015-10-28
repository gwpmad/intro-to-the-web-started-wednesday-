require 'sinatra'

get '/' do
  "hello!"
end

get '/secret' do
  "dumplings!"
end

get '/potato' do
  "potato"
end

get '/penguin' do
  erb :penguin
end

post '/named-cat' do
  p params
  @name = params[:name]
  erb :index
end


get '/random-cat' do
  @name = %w(Amigo Oscar Viking).sample
  erb :index
end

get '/cat-form' do
  # @name = p params[:name]
  erb :cat_form
end
