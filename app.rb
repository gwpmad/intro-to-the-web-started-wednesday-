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

get '/cat' do
  @random_name = %w(Amigo Oscar Viking).sample
  erb :index
end
