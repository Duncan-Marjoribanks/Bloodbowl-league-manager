require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')



get '/teams' do
  @team = Team.all
  erb ( :"teams/index" )
end
