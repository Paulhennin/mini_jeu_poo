class Player
  attr_accessor :name
  attr_accessor :life_points
  @@all_player_count = 0
  @@all_player = []

  def initialize (name)
    @name = name
    @life_points = 10
    @@all_player_count += 1
    @@all_player << self
    print "Nouvel utilisateur enregistré."
     puts @name

  end

  def show_state
    puts "José a : #{@life_points} points de vie !"
  end

  def gets_damage(damage_received)
    @damage_received = damage_received
      @life_points = @life_points- @damage_received
      puts "#{@name} à perdu #{@damage_received} points de vie !"
      if @life_points <= 0
        puts "Le joueur #{@name} a été tué."
    end
  end

  def compute_damage
    return (rand(1..6))
  end

  def attacks(player)
    damage = compute_damage
    puts "#{@name} attaque #{player.name}"
    puts "Il lui inflige #{damage} points de dommages."
    player.gets_damage(damage)
  end

end
