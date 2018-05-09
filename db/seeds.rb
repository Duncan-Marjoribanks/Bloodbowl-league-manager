require_relative('../models/race')
require_relative('../models/team')
require_relative('../models/game')
require('pry-byebug')

Game.delete_all()
Team.delete_all()
Race.delete_all()

#race seeds
race1 = Race.new ({
  'id' => 1,
  'name' => 'Humans',
  'bio' => 'Human teams tend to have a well-rounded skill set. This grants them a degree of versatility that means they can attempt any sort of play and are almost impossible to predict.'
  })
race1.save()

race2 = Race.new ({
  'id' => 2,
  'name' => 'Orcs',
  'bio' => 'Big, strong and heavily armoured, Orc teams’ preferred tactic is to mangle the opposing players until they litter the pitch and can no longer contest the ball – scoring points is a secondary concern.'
  })
race2.save()

race3 = Race.new ({
  'id' => 3,
  'name' => 'Goblins',
  'bio' => '‘Famous’ is a word that implies a level of prestige, and as such it’s not normally associated with Goblin teams. Diminutive and visciously inventive they often surprise their opponents with the sneaking a secret chainsaw onto the pitch.'
  })
race3.save()

race4 = Race.new ({
  'id' => 4,
  'name' => 'Chaotic Mutants',
  'bio' => 'Hailing from the frozen north of the Chaos wastes, this rabble of outcasts and heretical mutants have banded together to stomp some heads and score some goals. Having a few extra limbs an horns never hurts their chances either.'
  })
race4.save()

#team seeds
team1 = Team.new ({
  'name' => 'Reikland Reavers',
  'race' => race1.id
  })
team1.save()

team2 = Team.new ({
  'name' => 'Orcland Raiders',
  'race' => race2.id
  })
team2.save()

team3 = Team.new ({
  'name' => 'Chaos All Stars',
  'race' => race4.id
  })
team3.save()

team4 = Team.new ({
  'name' => 'The Lowdown Rats',
  'race' => race3.id
  })
team4.save()



# game seeds
game1 = Game.new ({
  'home' => team1.id,
  'home_score' => 3,
  'away' => team2.id,
  'away_score' => 2,
  })
game1.save()

game2 = Game.new ({
  'home' => team1.id,
  'home_score' => 3,
  'away' => team2.id,
  'away_score' => 4,
  })
game2.save()

game3 = Game.new ({
  'home' => team3.id,
  'home_score' => 5,
  'away' => team4.id,
  'away_score' => 2,
  })
game3.save()

game4 = Game.new ({
  'home' => team4.id,
  'home_score' => 2,
  'away' => team2.id,
  'away_score' => 4,
  })
game4.save()





  binding.pry
  nil
