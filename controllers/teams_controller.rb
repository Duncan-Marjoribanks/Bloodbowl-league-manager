require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')



get '/teams' do
  @teams = Team.all()
  erb ( :"teams/index" )
end

get '/teams/add_team' do
  erb ( :"teams/add_team" )
end

post '/teams' do
  @team = Team.new(params)
  @team.save()
  redirect to '/teams'
end
