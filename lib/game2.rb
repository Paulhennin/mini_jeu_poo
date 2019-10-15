require_relative 'player'
class Game
  attr_accessor :human_player , :enemies , :life_points , :player_left , :player_in_sight
@player_left = 10
@player_in_sight
  def initialize(name)
    #On initialise la partie, on crée notre joueur humain, et nos 4 bots
    @human_player = HumanPlayer.new(name)
    @enemies = []
    x= 9
    i = 1
    x.times do |i|
      player = Player.new("player#{i}")
      @enemies << player
    for i 1..4 do
      @player_in_sight << player
    end
  end
  puts @player_in_sight
    menu

  end

  def show_state
    #cette fonction montre le status actuel de la partie, il montre les bots restant ainsi que les points de vie du joueur.
    puts "#{@human_player.name} a : #{@human_player.life_points} points de vie !"
    puts "Il rest : #{@enemies.size} ennemis en lice. "
  end

  def kill_player(player)
    #Comme son nom l'indique la fonction sert exclusivement à effacer les bots morts pendant le tour.
    @enemies.delete(player)
    @player_left -= 1
    puts @enemies

  end

  def is_still_ongoing?
    #Cette fonction permet de faire un checkup de la partie à chaque tour. Si le joueur à plus de vie ou il n'y a plus de bots alors la partie se termine.
    if @human_player.life_points < 0 || @player_left.size >= 1
      puts "La partie est terminée."
      endgame
    else
      puts "La partie est toujours en cours, courage !"
      menu
    end
  end

  def menu

    #ici le menu. Il va afficher l'asset graphique nous permettant de faire nos choix
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
    #la boucle while permet de s'adapter au nombre de bots et de proposer un nombre de choix en fonction du nombre de bots visible
    while i < @enemies.size
      if @enemies[i].life_points > 0
        puts "#{i} - #{@enemies[i].name} a #{@enemies[i].life_points} points de vies"
      end
      i += 1
    end
    print "> "
    #lance la def suivante menu_choice
    menu_choice
  end

  def menu_choice
    #La boucle permet au joueur de faire un choix qui lui a été proposé dans le menu précédent.
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
    when "4"
      @human_player.attacks(@enemies[4])
      puts ""
    when "5"
      @human_player.attacks(@enemies[5])
      puts ""
    when "6"
      @human_player.attacks(@enemies[6])
      puts ""
    when "7"
      @human_player.attacks(@enemies[7])
      puts ""
    when "8"
      @human_player.attacks(@enemies[8])
      puts ""

    end
    puts "Votre tour est terminé ! C'est au tour des ennemis."
    #lance la def ennemies_attack
    enemies_attack
  end

  def enemies_attack
    #la def presque complexe. Dans un premier temps le premier each va chercher si des bots sont morts dans la partie
    @enemies.each do |player|
      if player.life_points < 0
        kill_player(player)
      end
    end
    #dans un second temps cette boucle each permettra aux bots survivant de lancer leur attaque.
    @enemies.each do |player|
          puts "Au tour de #{player.name} de t'attaquer ! Es-tu prêts ?"
          puts "Est tu prêts ?"
          puts "> "
          #Ce ask ne sert presque à rien, il permet de faire une pause dans la boucle afin de permettre au joueur de suivre l'état et l'avancement du round.
          ask = gets.chomp
          player.attacks(@human_player)
          puts "Il te reste #{@human_player.life_points} points de vie"
      end
      #lance la def is_still_ongoing? a ce stade de la partie, le round est terminé.
    is_still_ongoing?
  end

  def new_players_in_sight
    if @player_in_sight.size == @enemies
      puts "Tous les ennemis sont déjà en vue."
    else

    end

  end


    def endgame

      #on peut pas faire plus claire, cette def sert à envoyer le message de victoire ou de défaite.
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
