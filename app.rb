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
  # erb :index
"
  <div style='border: 20px dashed gray; width: 454px'>
  <img src = http://bit.ly/1eze8aE>
  </div>
  Waddup!
"
end