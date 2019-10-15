require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1=Player.new("José")
player2=Player.new("Josianne")


    while player1.life_points > 0 && player2.life_points > 0
      puts "#{player1.name} a #{player1.life_points} points de vie."
      puts "#{player2.name} a #{player2.life_points} points de vie."
      player1.attacks(player2)
      if player2.life_points < 0
        puts "#{player2.name} est mort ! #{player1.name} est victorieux !"
      else
        player2.attacks(player1)
      end

      if player1.life_points < 0
          puts "#{player1.name} est mort ! #{player2.name} est victorieux !"
      end
    end
