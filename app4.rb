require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game2'
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

  puts "Quel est votre pseudo ?"
  print "> "
  #demande le nom du joueur et lance le jeux.
  name = gets.chomp
my_game = Game.new(name)
