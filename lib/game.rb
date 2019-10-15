require_relative 'player'
class Game
  attr_accessor :human_player
  attr_accessor :enemies
  attr_accessor :life_points
  attr_accessor :count

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = []
    x= 4
    i = 1
    x.times do |i|
      player = Player.new("player#{i}")
      @enemies << player
    end
    menu

  end

  def show_state
    puts "#{@human_player.name} a : #{@human_player.life_points} points de vie !"
    puts "Il rest : #{@enemies.size} ennemis en lice. "
  end

  def kill_player(player)
    @enemies.delete(player)
    puts @enemies
  end

  def is_still_ongoing?
    if @human_player.life_points < 0 || @enemies.size == 0
      puts "La partie est terminée."
      endgame
    else
      puts "La partie est toujours en cours, préparez-vous pour un nouveau round !"
      menu
    end
  end

  def show_players
    puts human_player.show_state
    puts "Il reste : #{@enemies.size} ennemis dans la partie."
  end

  def menu
    show_state

    puts "Vous avez #{@human_player.life_points} points de vies"
    puts "Votre arme est de niveau #{@weapon_level} !"
    puts ""
    puts "Quelle action veux-tu effectuer ?"
    puts ""
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""
    puts "Attaquer un joueur en vue : "
    i = 0
    while i < @enemies.size
      if @enemies[i].life_points > 0
        puts "#{i} - #{@enemies[i].name} a #{@enemies[i].life_points} points de vies"
      end
      i += 1
    end
    print "> "
    menu_choice
  end

  def menu_choice
    choice = gets.chomp
    case choice
    when "a"
      @human_player.search_weapon
      puts ""
    when "s"
      @human_player.search_health_pack
      puts ""
    when "0"
      @human_player.attacks(@enemies[0])
      puts ""
    when "1"
      @human_player.attacks(@enemies[1])
      puts ""
    when "2"
      @human_player.attacks(@enemies[2])
      puts ""
    when "3"
      @human_player.attacks(@enemies[3])
      puts ""
    end
    puts "Votre tour est terminé ! C'est au tour des ennemis."
    enemies_attack
  end

  def enemies_attack
    @enemies.each do |player|
      if player.life_points < 0
        kill_player(player)
      end
    end
    @enemies.each do |player|
          puts "Au tour de #{player.name} de t'attaquer ! Es-tu prêts ?"
          puts "Est tu prêts ?"
          puts "> "
          ask = gets.chomp
          player.attacks(@human_player)
          puts "Il te reste #{@human_player.life_points} points de vie"
      end
    is_still_ongoing?
  end

    def endgame
      if @human_player.life_points > 0 && @enemies.size == 0
        puts " #{@human_player.name} a gagné la parti ! "
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
      puts ""
    end

end
