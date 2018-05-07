require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/game')
require_relative('../models/team')

get '/games' do
  @games = Game.all()
  erb ( :"games/index" )
end

get '/games/add_game' do
  @teams = Team.all()
  erb ( :"games/add_game" )
end

post '/games' do
  @game = Game.new(params)
  @game.save()
  redirect to '/games'
end

post '/games/:id/delete' do
  game = Game.find(params['id'])
  game.delete
  redirect to '/games'
end
