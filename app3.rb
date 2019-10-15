require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


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
  name = gets.chomp
my_game = Game.new(name)
