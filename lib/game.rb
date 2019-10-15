require_relative 'player'
class Game
  attr_accessor :human_player
  attr_accessor :enemies
  @@enemies_count = 0

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = []
    x= 4
    i = 1
    x.times do
      player = Player.new("player#{i}")
      @enemies << player
      i += 1
      @@enemies_count += 1
    end
    menu
  end

  def show_state
    puts "#{@human_player} a : #{@life_points} points de vie !"
  end

  def kill_player(drop_player)
    @enemies.each do |enemies|
      if drop_player == enemies.name
        @enemies.name.drop
      end
      @@enemies_count -= 1
    end
  end

  def is_still_ongoing?
    if @human_player.life_points < 0 || @@enemies_count == 0
      puts "La partie est terminée."
      endgame
    else
      puts "La partie est toujours en cours, préparez-vous pour un nouveau round !"
      menu
    end
  end

  def show_players
    puts human_player.show_state
    puts "Il reste : #{@@enemies_count} ennemis dans la partie."
  end

  def menu
    show_state
    puts "Vous avez #{@human_player.life_points} points de vies"
    puts ""
    puts "Quelle action veux-tu effectuer ?"
    puts ""
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""
    puts "Attaquer un joueur en vue : "
    if @enemies[0].life_points > 0
      puts "0 - #{@enemies[0].name} a #{@enemies[0].life_points} points de vies"
    end
    if @enemies[1].life_points > 0
      puts "1 - #{@enemies[1]} a #{@enemies[1].life_points} points de vies"
    end
    if @enemies[2].life_points > 0
      puts "2 - #{@enemies[2].name} a #{@enemies[2].life_points} points de vies"
    end
    if @enemies[3].life_points > 0
      puts "3 - #{@enemies[3].name} a #{@enemies[3].life_points} points de vies"
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
    @ennemies.each do |player|
      if player.life_points >0
          puts "Au tour de #{player} de t'attaquer ! Es-tu prêts ?"
          puts "Est tu prêts ?"
          puts "> "
          ask = gets.chomp
        player.attacks(@human_player)
      else kill_player(player)
      end
    end
    is_still_ongoing?
  end

    def endgame
      if @human_player.life_points > 0 && @@enemies_count == 0
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
