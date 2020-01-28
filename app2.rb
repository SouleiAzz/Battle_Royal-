require 'bundler'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/player'
puts "                      ___________________ ____________________________  ._________________________" 
puts "                      \_   _____/\_____  \\______   \__    ___/\      \ |   \__    ___/\_   _____/"
puts "                       |    __)   /   |   \|       _/ |    |   /   |   \|   | |    |    |    __)_  "
puts "                       |     \   /    |    \    |   \ |    |  /    |    \   | |    |    |        \ "
puts "                       \___  /   \_______  /____|_  / |____|  \____|__  /___| |____|   /_______  / "
puts "                           \/            \/       \/                  \/                       \/  "
puts "                                          -------------------------------------------------"
puts "                                          |Bienvenue sur FORTNITE: ALIEXPRESS EDITION !   |"
puts "                                          |Le but du jeu est d'être le dernier survivant !|"
puts "                                          -------------------------------------------------"
puts "\n"
puts "Entre un pseudonyme"
print ' > '
pseudo = gets.chomp
you = HumanPlayer.new(pseudo)

enemies = []
josiane = Player.new("Josiane")
jose = Player.new("José")
enemies << josiane 
enemies << jose

  while you.life_points.positive? && (josiane.life_points.positive? || jose.life_points.positive?)
    you.show_state

  puts "Quelle action veux-tu effectuer ?"
  puts "\n"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "\n"
  puts "attaquer un joueur en vue :"
  puts "0 - Josiane à #{josiane.life_points} points de vie"
  puts "1 - José à #{jose.life_points} points de vie"
  puts "\n" 
  puts "Utilise n'importe quel autre touche pour quitter" 
  puts "\n"
  print "Entre ton choix>"
  choice = gets.chomp
  puts "\n" * 20
  if choice == "a"
    you.search_weapon
  elsif choice == "s"
  	you.search_health_pack
  elsif choice == "0"
    you.attacks(josiane)
  elsif choice == "1"
   you.attacks(jose)
  else 
   puts " Oups tu nous quitte sans même sauvegarder :/ " 
   return choice 
  end

  if josiane.life_points > 0 || jose.life_points > 0
     puts "\n"
     puts "On t'attaque !"
     puts "\n"
  end
  enemies.each do |enemies|
    unless enemies.life_points <= 0
      enemies.attacks(you)
   end
  
  if josiane.life_points <= 0 && jose.life_points <= 0 
   puts "TOP 1 IZI!"
  else you.life_points >= 0 
    puts "GAME OVER !"
  end
 end 
end
