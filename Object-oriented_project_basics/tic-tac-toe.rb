class Player
    def assign_markers(markers)
        markers_util=["X","O"]
        @markers.each do |player, marker|
            if player == 1 
                puts "Player #{player}, select a marker! X or O?"
                marker = gets.chomp.to_str.upcase
                @markers[player] = marker
                markers_util.delete(marker)
            end
            next if player == 1
                markers_util = markers_util.join("")
                puts "Player #{player} is assigned marker #{markers_util}. Lets play!"
                @markers[player] = markers_util
        end
    end

    @@available_positions=[1,2,3,4,5,6,7,8,9]

    def player_select(player, selection)
            loop do          
                puts "Player #{player}'s turn. Please select position:"
                @position = gets.chomp.to_i
                if @@available_positions.include?(@position)
                    selection.push(@position)
                    @@available_positions.delete(@position)
                    break
                else
                    puts "Position #{@position} is not available. Try again."
                end
                end
        end
    attr_accessor :selection, :player

    def commit_position(player)
        @board.each do |row|
            if row.include?(@position) == true
                row.map! {|n| n==@position ? 
                    @markers[player] : n}
                end
            end
    end

end

class Game < Player
    attr_accessor :player_one, :player_two
    def initialize(player_one, player_two) 
        @player_one = 1
        @player_two = 2
        @players={@player_one => [],@player_two =>[]}
        @markers = {@player_one => "", @player_two => ""}
        @board = [[1,2,3],[4,5,6],[7,8,9]]
        @game_over = false
        assign_markers(@markers)
        self.rounds(@players)
        puts "Game over. Play again?"
    end
    @@winning_combo=[[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[7,5,3]]


    def rounds(players)
        while @game_over == false
            @players.to_h.each {|player, selection| 
                player_select(player, selection) 
                commit_position(player)
                puts "Player #{player} placed marker on position #{@position}"
                self.display_board(@board)
                self.win?(player, selection)
                self.draw?()
                if @game_over == true
                    break 
                end
            }
        end
    end

    def display_board(board)
        row_separator = "--+---+--"
        puts @board.map {|row| [row.join(" | ")].push(row_separator)}
    end

    def win?(player, selection)
        @@winning_combo.each do |combo|
            if (combo & selection == combo) == true
                puts "Congratulations! Player #{player} wins." 
                @game_over = true
            end
        end
    end

    def draw?()
        if @@available_positions.empty? == true
            puts "It's a draw!"
            @game_over = true
        end
    end

end

Game.new("Player 1","Player 2")