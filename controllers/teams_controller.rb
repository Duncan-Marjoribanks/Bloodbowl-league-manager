require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')
require_relative('../models/game')
require_relative('../models/race')


get '/teams' do
  @teams = Team.all()
  erb ( :"teams/index" )
end

get '/teams/add_team' do
  @races = Race.all()
  erb ( :"teams/add_team" )
end

post '/teams' do
  @team = Team.new(params)
  @team.save()
  redirect to '/teams'
end

post '/teams/:id/delete' do
  team = Team.find(params['id'].to_i)
  team.delete
  redirect to '/teams'
end

post '/teams/:id/update' do
  team = Team.new(params)
  team.update
  redirect to '/teams'
end

get '/teams/:id' do
  @team = Team.find(params['id'].to_i)
  @games = Game.all
  erb( :"teams/show" )
end

post '/teams/delete_all' do
  Team.delete_all
  redirect to '/teams'
end
