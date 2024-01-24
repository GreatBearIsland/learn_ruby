class Game 
    attr_accessor :players, :markers, :markers_util, :available_positions, :row_separator, :winning_combo
    def initialize 
        @players={1 => [],2 =>[]}
        @markers = {1 => "", 2 => ""}
        @markers_util=["X","O"]
        @board = [[1,2,3],[4,5,6],[7,8,9]]
        @row_separator = "--+---+--"
        @winning_combo = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[7,5,3]]
        @available_positions=[1,2,3,4,5,6,7,8,9]
        @game_over = false
        play
    end


    def play
        puts "***** Game start! *****"
        assign_markers
        display_board
        rounds
        puts "Game over. Play again?"
    end


    def assign_markers
        @markers.each do |player, marker|
            if player == 1 
                puts "First, let's select markers.\nPlayer #{player}, please select a marker! X or O?"
                marker = gets.chomp.to_str.upcase
                until @markers_util.include?(marker) == true do
                    puts "Invalid input. Please select either X or O"
                    marker = gets.chomp.to_str.upcase
                end
                @markers[player] = marker
                @markers_util.delete(marker)
                puts "Okay! Player #{player} selected #{@markers[player]}."
            else
                @markers_util = @markers_util.join("")
                puts "Player #{player} is assigned marker #{@markers_util}. \n***** Lets play! *****"
                @markers[player] = @markers_util
            end
        end
    end


    def rounds
        while @game_over == false
            @players.to_h.each {|player, selection| 
                player_select(player, selection)
                commit_position(player)
                display_board
                win?(player, selection)
                draw?
                break if @game_over == true
            }
        end
    end


    def player_select(player, selection)
        puts "It's Player #{player}'s turn. Please select position:"
        @position = gets.chomp.to_i
        until @available_positions.include?(@position) == true do
            puts "Position #{@position} is not available. Try again."
            @position = gets.chomp.to_i
        end
            @players[player].push(@position)
            @available_positions.delete(@position)
    end


    def commit_position(player)
        @board.each do |row|
            if row.include?(@position) == true
                row.map! {|n| n==@position ? 
                    @markers[player] : n}
                end
            end
    end


    def display_board
        puts @board.map {|row| [row.join(" | ")].push(@row_separator)}
    end


    def win?(player, selection)
        @winning_combo.each do |combo|
            if (combo & selection == combo) == true
                puts "***** Congratulations! Player #{player} wins *****" 
                @game_over = true
            end
        end
    end


    def draw?
        return nil unless @available_positions.empty? == true && @game_over == false
            puts "***** It's a draw! *****"
            @game_over = true
    end

end


Game.new
