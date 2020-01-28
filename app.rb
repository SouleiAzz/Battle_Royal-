
require 'bundler'
Bundler.require
require_relative './lib/game'
require_relative './lib/player'


player1 = Player.new("Josiane")
player2 = Player.new("José")
puts "                                                   Bienvenue dans FORTNITE 3 THP's EDITION                                        "
puts "                                                      Voici les participants du jour:                                             "
puts "\n"
puts "-------------------------------------->  A ma droite, la belle l'unique mais aussi dangereuse :Josiiiannnneee !!!!     <-----------------------------"
puts "-------------------------------------->   Et à ma gauche, on ne le présente plus, il nous vient tout droit de corrèze: Josééy!!  <------------------------------"
 
 while player1.life_points > 0 && player2.life_points > 0
   puts "Récap de la vie de nos combattants : "
   player1.show_state
   player2.show_state
   puts "\n"
    puts "A l'attaque!:"
    puts "\n"
     player1.attacks(player2)
     player2.attacks(player1)

  if player1.life_points <= 0 || player2.life_points <= 0
  break 
  end
 end	

