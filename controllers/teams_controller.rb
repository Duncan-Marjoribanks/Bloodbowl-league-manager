require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')



get '/teams' do
  @teams = Team.all
  erb ( :"teams/index" )
end

get '/team/add_team' do
  erb ( :"teams/add_team" )
end
