require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/game')


get '/games' do
  @games = Game.all
  erb ( :"games/index" )
end

# get '/games/:id' do
#   @games = Game.find(params['id'].to_i)
#   erb(:"games/show")
# end
