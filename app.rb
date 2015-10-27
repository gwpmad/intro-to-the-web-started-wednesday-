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
