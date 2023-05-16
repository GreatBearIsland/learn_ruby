class Player
    def initialize(player1, player2) 
        @current_player = 
        @selected_position=[]
        end

    def select_position!
        @game.board
        loop do
          print "Input your #{marker} position: "
          selected_position = gets.to_i
          return selected_position if @game.free_positions.include?(selected_position)
          puts "Position #{selected_position} is not available. Try again."
        end
end

class Game
@@board=[[1,2,3],[4,5,6],[7,8,9]]
@@winning_combo=[[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[7,5,3]]
@@available_positions=[1,2,3,4,5,6,7,8,9]

    def evaluate_available_position? 
        available_positions.(selected_position).pop if .include?(selected_position)
    end



    def show_board
        board.each_with_index do 
        teacher_mailboxes.each_with_index do |row, row_index|
            puts "Row:#{row_index} = #{row}"
          end
          #=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
          #=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
          #=> Row:2 = ["Perez", "Scott", "Smith", "Young"]
          #=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]
    end


    def win?

    end
    
    def switch_player

    end


end



