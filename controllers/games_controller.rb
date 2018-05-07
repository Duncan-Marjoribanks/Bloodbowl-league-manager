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
  game = Game.find(params['id'].to_i)
  game.delete
  redirect to '/games'
end

post '/games/:id/update' do
  game = Game.find(params['id'].to_i)
  game.update
  redirect to '/games'
end

get '/games/:id' do
  @game = Game.find(params['id'].to_i)
  erb( :"game/show" )
end
