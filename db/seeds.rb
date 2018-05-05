require_relative('../models/team')
require_relative('../models/game')
require('pry-byebug')

Game.delete_all()
Team.delete_all()

#team seeds

team1 = Team.new ({
  'name' => 'Reikland Reavers'
  })
team1.save()

team2 = Team.new ({
  'name' => 'Orcland Wanderers'
  })
team2.save()




# game seeds
game1 = Game.new ({
  'team_a' => team1.id,
  'team_b' => team2.id,
  'winner' => team1.id
  })
game1.save()

game2 = Game.new ({
  'team_a' => team1.id,
  'team_b' => team2.id,
  'winner' => team2.id
  })
game2.save()





binding.pry
  nil
