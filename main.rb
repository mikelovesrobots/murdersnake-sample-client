require 'sinatra'
require File.join(File.dirname(__FILE__), "game_map.rb")

get '/snake' do
  map = GameMap.new(params[:map])
  # AI.new(map).move
end
