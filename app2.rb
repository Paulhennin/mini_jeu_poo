require 'bundler'
Bundler.require

require_relative 'lib/player'

#petit asset graphique permetant l'affichage et le début du jeux.
  puts "     ====================================================="
  puts "     ||                                                 ||"
  puts "     ||    Bienvenue sur 'ILS VEULENT TOUS MA POO' !    ||"
  puts "     || Le but du jeu est d'être le dernier survivant ! ||"
  puts "     ||                                                 ||"
  puts "     ====================================================="
  puts "                     Un batle royel quoi.                 "
  puts ""
  puts ""
#demande le nom du joueur et lance le jeux.
  puts "Quel est votre pseudo ?"
  print "> "
  name = gets.chomp
  player_one = HumanPlayer.new(name)
  puts "Bienvenu dans notre petit jeu #{player_one.name}"
  puts "Vous allez jouer contre 2 bots, (des mecs nuls en soit.)"
enemies = []
#ajout des bots au jeux.
player1=Player.new("Faker")
puts "Player1 have been added. #{player1.name} entre en jeu."
enemies << player1
player2=Player.new("Caps")
puts "Player2 have been added. #{player2.name} entre en jeu."
enemies << player2
binding.pry

#Boucle disant : tant que le joueur à de la vie ET qu'au moins 1 des deux bots est vivant. Alors faire .....

  while player_one.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)
    puts "Vous avez #{player_one.life_points} points de vies"
    puts ""
    puts "Quelle action veux-tu effectuer ?"
    puts ""
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""
    puts "Attaquer un joueur en vue : "
    #Check la vie des bots . N'affiche que le choix du bot vivant correspondant.
    if player1.life_points > 0
      puts "0 - #{player1.name} a #{player1.life_points} points de vies"
    end
    if player2.life_points > 0
      puts "1 - #{player2.name} a #{player2.life_points} points de vies"
    end
    print "> "
    choice = gets.chomp
#demande le choix de l'utilisateur
    case choice
    when "a"
      player_one.search_weapon
      puts ""
    when "s"
      player_one.search_health_pack
      puts ""
    when "0"
      player_one.attacks(player1)
      puts ""
    when "1"
      player_one.attacks(player2)
      puts ""
    end
    puts ""
    #Fait attaquer les bots survivants.
    ennemies.each do |player|
      if player.life_points >0
          puts "Au tour de #{player}de t'attaquer ! Es-tu prêts ?"
          ask = gets.chomp
        player.attacks(player_one)
      end
    end
    puts ""
  end
#fin de partie
if player_one.life_points > 0
  puts " #{player_one.name} a gagné la parti ! "
  puts "     ====================================================="
  puts "     ||                                                 ||"
  puts "     ||                                                 ||"
  puts "     ||                FELICITATION !!                  ||"
  puts "     ||                                                 ||"
  puts "     ||                                                 ||"
  puts "     ====================================================="
else
  puts "     ====================================================="
  puts "     ||                                                 ||"
  puts "     ||                                                 ||"
  puts "     ||                LOOSER SPOTTED!                  ||"
  puts "     ||                                                 ||"
  puts "     ||                                                 ||"
  puts "     ====================================================="
end
