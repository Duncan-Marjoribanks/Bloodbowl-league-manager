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
  'bio' => 'Human teams tend to have a well-rounded skill set. This grants them a degree of versatility that means they can attempt any sort of play and are almost impossible to predict.',
  'logo' => '/images/human_logo.png'
  })
race1.save()

race2 = Race.new ({
  'id' => 2,
  'name' => 'Orcs',
  'bio' => 'Big, strong and heavily armoured, Orc teams’ preferred tactic is to mangle the opposing players until they litter the pitch and can no longer contest the ball – scoring points is a secondary concern.',
  'logo' => '/images/orc_logo.png'
  })
race2.save()

race3 = Race.new ({
  'id' => 3,
  'name' => 'Goblins',
  'bio' => '‘Famous’ is a word that implies a level of prestige, and as such it’s not normally associated with Goblin teams. Diminutive and visciously inventive they often surprise their opponents with the sneaking a secret chainsaw onto the pitch.',
  'logo' => '/images/goblin_logo.png'
  })
race3.save()

race4 = Race.new ({
  'id' => 4,
  'name' => 'Chaotic Mutants',
  'bio' => 'Hailing from the frozen north of the Chaos wastes, this rabble of outcasts and heretical mutants have banded together to stomp some heads and score some goals. Having a few extra limbs and horns never hurts their chances either.',
  'logo' => '/images/chaos_logo.png'
  })
race4.save()

race5 = Race.new ({
  'id' => 5,
  'name' => 'Elves',
  'bio' => 'Elves are fragile, pointy, and FAST. They believe they are the best and are irritatingly often proven to be right, which makes it all the more satisfying when one of them is maimed on the pitch',
  'logo' => '/images/elf_logo.png'
  })
race5.save()

race6 = Race.new ({
  'id' => 6,
  'name' => 'Dwarves',
  'bio' => 'Dwarves are a stubborn and stalwart race, favouring a slow solid advance over a fast uncontrolled rush. This is true even when it comes to Blood Bowl. Many Dwarf teams believe a good defence is the best offence, just dont ask them top pass the ball.',
  'logo' => '/images/dwarf_logo.png'
  })
race6.save

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

team5 = Team.new ({
  'name' => 'Elfheim Eagles',
  'race' => race5.id
  })
team5.save()

team6 = Team.new ({
  'name' => 'Dwarven Giants',
  'race' => race6.id
  })
team6.save()

# game seeds
game1 = Game.new ({
  'home' => team1.id,
  'home_score' => 3,
  'away' => team2.id,
  'away_score' => 2
  })
game1.save()

game2 = Game.new ({
  'home' => team1.id,
  'home_score' => 3,
  'away' => team2.id,
  'away_score' => 4
  })
game2.save()

game3 = Game.new ({
  'home' => team3.id,
  'home_score' => 5,
  'away' => team4.id,
  'away_score' => 2
  })
game3.save()

game4 = Game.new ({
  'home' => team4.id,
  'home_score' => 2,
  'away' => team2.id,
  'away_score' => 4
  })
game4.save()

game5 = Game.new ({
  'home' => team5.id,
  'home_score' => 5,
  'away' => team3.id,
  'away_score' => 4
  })
game5.save()

game6 = Game.new ({
  'home' => team2.id,
  'home_score' => 2,
  'away' => team5.id,
  'away_score' => 3
  })
game6.save()

game7 = Game.new ({
  'home' => team6.id,
  'home_score' => 1,
  'away' => team3.id,
  'away_score' => 3
  })
  game7.save()




  binding.pry
  nil
