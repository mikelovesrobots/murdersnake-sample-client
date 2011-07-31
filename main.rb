require 'sinatra'
require File.join(File.dirname(__FILE__), "coordinate.rb")
require File.join(File.dirname(__FILE__), "ai.rb")
require File.join(File.dirname(__FILE__), "game_map.rb")

post '/snake' do
  map = GameMap.new(params[:map])
  AI.new(map).move
end
