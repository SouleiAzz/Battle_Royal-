 class Player 
  attr_accessor :name, :life_points

  def initialize(name)
    @name=name
    @life_points = 10
  end

  def show_state
    puts "#{@name} à #{@life_points} points de vie" 
  end
 
 def gets_damage(damage)
   @life_points-=damage 
    if @life_points <= 0 
     puts "RIP! #{name} est mort "
   end
 end
 
  def attacks(player)
    puts "-------------------------------------------------------------------------------------"
    puts " /!\  Le joueur #{@name} attaque #{player.name} !! /!\|" 
    damage = compute_damage
    puts "-------------------------------------------------------------------------------------"
    puts "|===> le joueur #{@name} inflige #{damage} points de dégats à #{player.name} ! <=== |"
    puts "-------------------------------------------------------------------------------------"
    player.gets_damage(damage) 
 end  

   def compute_damage
    return rand(1..6)
  end

end


class HumanPlayer < Player 
attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts " #{@name} est à #{@life_points} de points de vie et possède une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_level = rand(1..6) 
    puts "Tu as trouvé une arme de niveau #{weapon_level}"
      if weapon_level > @weapon_level
        @weapon_level = weapon_level
        puts "Pas mal cette nouvelle arme!"
      else
        puts "Ouais bof elle vaut pas l'ancienne.."
      end
  end


  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Dommage il n'y a rien"
    elsif health_pack == 6
      @life_points = @life_points + 80
        if @life_points > 100
      	@life_points = 100
        end
    puts "Jackpot! +80 de points de vie!"
    else #Donc pour tout ceux qui n'ont pas été cité (de 2 à 5) 
      @life_points = @life_points + 50
        if @life_points > 100
      	@life_points = 100
        end
      puts "Yes! +50 de points de vie !"
    end
  end
end	
