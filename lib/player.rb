require 'pry'
class Player
    attr_accessor :name, :life_points # Création de deux attributs (attr)

    def initialize(player_name) # L'utilisateur définit dans la console un prénom pour son héro (player1 = User.new("José"))
        @name = player_name # "José" est placé dans la variable d'instance @name
        @life_points = 10 # par défaut @life_points contient 10 points de vie en début de jeu
    end

    def show_state # Affiche le nom et le nombre de points de vie d'un héro (player1.show_state)
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage_suffered) # Définit l'état du player en fonction de ce qu'il a subi comme dégats
        @life_points -= damage_suffered # Nombre de points du player moins les points subits
        if damage_suffered == 0
            puts "Rien ne se passe"
        elsif damage_suffered > 0
            if @life_points <= 0
                @life_points = 0
                puts
                puts "          ¯\\_(ﾒ﹏ﾒ)_/¯"
                puts
                puts "le joueur #{@name} a été tué !"
                # exit # Arrête la partie dès qu'un joueur est tué.
            else
                puts "#{@name} n'a plus que #{@life_points} points de vie"
            end
        end
    end

    def life_bar
        life_points_percent = self.life_points * 10 # calcule le pourcentage de vie d'un joueur en multipliant ses points de vie par 10.
        full_bar = "█" * (life_points_percent /10).to_i # définit une barre remplie en utilisant un caractère "█" répété autant de fois que le pourcentage de vie d'un joueur divisé par 10.
        empty_bar = "▒" * ((100 - life_points_percent) /10).to_i # définit une barre vide en utilisant un caractère "▒" répété autant de fois que le pourcentage restant de vie d'un joueur divisé par 10 (calculé en soustrayant le pourcentage de vie actuel à 100).
        "#{full_bar}#{empty_bar} #{life_points_percent}%" # concatène la barre pleine, la barre vide et le pourcentage de vie du joueur pour afficher l'état de vie du joueur sous forme de barre et de pourcentage.
    end

    def attacks(player) # Défini (via l'attaque random de compute_damage) le nombre de points d'attque qu'inflige un player.
        puts "#{@name} attaque #{player.name}      (ง'̀-'́)ง"
        attack_points = compute_damage
        puts "Et BIM! #{attack_points} points de dommages ! 	    	 (-_☆)~  Outch..."
        player.gets_damage(attack_points)
    end

    def compute_damage # Défini une attaque random de 1 à 6
        return rand(1..6)
    end

end


class HumanPlayer < Player
    attr_accessor :weapon_level
    
    def initialize(human_player_name)
        @name = human_player_name
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
    end

    def life_bar
        life_points_percent = self.life_points # calcule le pourcentage de vie d'un joueur en multipliant ses points de vie par 10.
        full_bar = "█" * (life_points_percent ).to_i# définit une barre remplie en utilisant un caractère "█" répété autant de fois que le pourcentage de vie d'un joueur divisé par 10.
        empty_bar = "▒" * ((100 - life_points_percent) ).to_i # définit une barre vide en utilisant un caractère "▒" répété autant de fois que le pourcentage restant de vie d'un joueur divisé par 10 (calculé en soustrayant le pourcentage de vie actuel à 100).
        "#{full_bar}#{empty_bar} #{life_points_percent}%" # concatène la barre pleine, la barre vide et le pourcentage de vie du joueur pour afficher l'état de vie du joueur sous forme de barre et de pourcentage.
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{weapon_level} !"
        puts ".______________________________________________________|_._._._._._._._._._."
        puts " \\_____________________________________________________|_#_#_#_#_#_#_#_#_#_|"
        puts "                                                       l"
        if new_weapon_level > @weapon_level
            @weapon_level = new_weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : Tu la prends."
        elsif new_weapon_level <= @weapon_level
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..: Tu la laisse là où elle est."
        end
    end

    def search_health_pack
        find_health_pack = rand(1..6)
        if find_health_pack == 1
            puts "Tu n'as rien trouvé... "
        elsif find_health_pack >= 2 && find_health_pack <= 5
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            if @life_points <= 50 && @life_points > 0
                @life_points += 50
            else
                @life_points = 100
            end
        else
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            if @life_points <= 20 && @life_points > 0
                @life_points += 80
            else
                @life_points = 100
            end
        end
    end

end
# binding.pry

