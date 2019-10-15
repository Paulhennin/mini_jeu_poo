class Player
  attr_accessor :name
  attr_accessor :life_points
  @@all_player_count = 0
  @@all_player = []

  def initialize (name)
    #mets en place la classe avec les différentes variables
    @name = name
    @life_points = 10
    @@all_player_count += 1
    @@all_player << self
    print "Nouvel utilisateur enregistré. "
     puts @name

  end

  def show_state
    #montre l'état actuel du joueur1
      puts "José a : #{@life_points} points de vie !"
  end

  def gets_damage(damage_received)

    #Fonction permettant de recalculer la vie du joueur après avoir pris des damages.
    @damage_received = damage_received
      @life_points = @life_points- @damage_received
      puts "#{@name} à perdu #{@damage_received} points de vie !"
      if @life_points <= 0
        puts "Le joueur #{@name} a été tué."
    end
  end

  def compute_damage
    #fonction permettant le lancé de dé
    return (rand(1..6))
  end

  def attacks(player)
    #mets en place l'attaque du joueur
    damage = compute_damage
    puts "#{@name} attaque #{player.name}"
    puts "Il lui inflige #{damage} points de dommages."
    player.gets_damage(damage)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level
  attr_accessor :name
  attr_accessor :life_points

  def initialize(name)
    #initialise la classe HumanPlayer donc la class du joueur humain. Vous quoi.
    @weapon_level = 1
    @life_points = 100
    @name = name
  end

  def compute_damage
    #fait le lancé de dé. multiplié par l'arme équipée du joueur
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    #methode permettant d'améliorer son arme... Quand on est chanceux.
    found = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{found} !"
    if found > @weapon_level
      @weapon_level = found
      puts "Génial ! Elle est bien meilleure que ton arme actuelle ! Tu la prends !"
    else
      puts "Ah ah ! Quelle trouvaille de merde ! vaut mieux garder l'ancienne ! "
  end

  def search_health_pack
    #methode permettant de regagner de la vie.. Quand on a de la chance.
    found = rand(1..6)
    if found == 1
      puts "Tu as fait un jet de dé de 1."
      puts "Dommage ! Tu n'as rien trouvé.."
    elsif found >= 2 && found <=5
      puts "Vous avez fait un jet de dé de #{found}."
      puts "Super ! #{@name} a trouvé un pack de +50 points de vie."
      @life_points = @life_points + 50
    else
      puts "Vous avez fait un jet de dé de 6 !"
      puts "Impressionnant ! Vous avez trouvé un pack de +80 points de vie."
      @life_points = @life_points + 80
    end
    #petite ligne supplémentaire permettant de limiter la vie maximale a 100
    if @life_points > 100
      @life_points = 100
    end
  end

end



end
