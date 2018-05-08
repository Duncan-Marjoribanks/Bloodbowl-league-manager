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
  'name' => 'Orcland Raiders'
  })
team2.save()

team3 = Team.new ({
  'name' => 'Chaos All Stars'
  })
  team3.save()

team4 = Team.new ({
  'name' => 'The Lowdown Rats'
  })
team4.save()



# game seeds
game1 = Game.new ({
  'home' => team1.id,
  'away' => team2.id,
  'winner' => team1.id
  })
game1.save()

game2 = Game.new ({
  'home' => team1.id,
  'away' => team2.id,
  'winner' => team2.id
  })
game2.save()

game3 = Game.new ({
  'home' => team3.id,
  'away' => team4.id,
  'winner' => team3.id
  })
game3.save()

game4 = Game.new ({
  'home' => team4.id,
  'away' => team2.id,
  'winner' => team2.id
  })
game4.save()





binding.pry
  nil
