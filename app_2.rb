require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

system 'clear' 
puts "     ___  ___   _____        _____   _____   _   _   _           ___   _____    _____  "
puts "    /   |/   | /  ___|      /  ___/ /  _  \\ | | | | | |         /   | |  _  \\  |  _  \\ "
puts "   / /|   /| | | |          | |___  | | | | | | | | | |        / /| | | |_| |  | | | | "
puts "  / / |__/ | | | |          \\___  \\ | | | | | | | | | |       / /_| | |  _  /  | | | | "
puts " / /       | | | |___        ___| | | |_| | | |_| | | |___   / /  | | | | \\ \\  | |_| | "
puts "/_/        |_| \\_____|      /_____/ \\_____/ \\_____/ |_____| /_/   |_| |_|  \\_\\ |_____/ "
puts 
puts " _     _   _____  "
puts "| |   / / /  ___/ "
puts "| |  / /  | |___  "
puts "| | / /    \\___ \\ "
puts "| |/ /     ___| | "
puts "|___/     /_____/ "
puts 
puts " _   __   _   _     _   _   _____   _   _____   _       _____        _____   _   _____   _   _   _____   _____   _____    _____  "
puts "| | |  \\ | | | |   / / | | /  ___/ | | |  _  \\ | |     | ____|      |  ___| | | /  ___| | | | | |_   _| | ____| |  _  \\  /  ___/ "
puts "| | |   \\| | | |  / /  | | | |___  | | | |_| | | |     | |__        | |__   | | | |     | |_| |   | |   | |__   | |_| |  | |___  "
puts "| | | |\\   | | | / /   | | \\___  \\ | | |  _  { | |     |  __|       |  __|  | | | |  _  |  _  |   | |   |  __|  |  _  /  \\___  \\ "
puts "| | | | \\  | | |/ /    | |  ___| | | | | |_| | | |___  | |___       | |     | | | |_| | | | | |   | |   | |___  | | \\ \\   ___| | "
puts "|_| |_|  \\_| |___/     |_| /_____/ |_| |_____/ |_____| |_____|      |_|     |_| \\_____/ |_| |_|   |_|   |_____| |_|  \\_\\ /_____/ "
gets
system 'clear'

#Création des joueurs
puts "Une voix se fait entendre..."
gets
puts "                                                                                                                             baston"
gets
puts "Comment t'appelles tu ?"

name = gets.chomp.to_s
user = HumanPlayer.new(name)
player1 = Player.new("Josiane")
player2 = Player.new("José")
# binding.pry
# Tableau d'ennemis
enemies = [player1, player2]
# jose = Player.new("José")
# josiane = Player.new("Josiane")
# enemies << jose << josiane

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts "Voici l'état de chaque joueur :"
    puts "-------------------------------"
    user.show_state
    puts user.life_bar
    player1.show_state
    puts player1.life_bar
    player2.show_state
    puts player2.life_bar
    gets
    system 'clear'
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts
    puts "attaquer un joueur en vue :"
    puts "0 - #{player1.name} a #{player1.life_points} points de vie"
    puts "1 - #{player2.name} a #{player2.life_points} points de vie"
    choice = gets.chomp
    case choice
        when "a"
            user.search_weapon
        when "s"
            user.search_health_pack
        when "0"
            user.attacks(player1)
        when "1"
            user.attacks(player2)
    end

    puts "Les autres joueurs t'attaquent !"
    enemies.each do |enemy|
        if enemy.life_points > 0
            enemy.attacks(user)
        end
    end
    gets
end

# puts "Les autres joueurs t'attaquent !"
# enemies.each do |enemy|
#     enemy.attacks(user)
# end
gets


# Fin du jeu
puts "La partie est finie"
if human_player.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
else
    puts "Looser ! Tu as perdu !"
end


# binding.pry