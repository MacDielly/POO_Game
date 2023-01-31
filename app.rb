require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Création des joueurs
player1 = Player.new("Josiane")
player2 = Player.new("José")

system 'clear'
puts " ___________________________________"
puts "|Josiane et José sont ENCORE IVRES !|"
puts "|        Ça sent le pâté !          |"
puts " ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯"

while player1.life_points > 0 && player2.life_points >0
    #Présentation des joueurs
    gets
    system 'clear'
    puts "Voici l'état de chaque joueur :"
    puts "-------------------------------"
    player1.show_state
    puts player1.life_bar
    player2.show_state
    puts player2.life_bar
    #Début du combat
    puts
    puts "Passons à la phase d'attaque :"
    puts "-------------------------------"
    gets

    #Josiane attaque José
    player1.attacks(player2)
    gets
    #José attaque Josiane
    player2.attacks(player1) # CODER:  Si l'un des deux est mort, exit!

    # Appuyer sur [entrée] pour faire défiler la suite.
    gets
    system 'clear'
end

# binding.pry