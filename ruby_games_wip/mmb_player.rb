
class Player

    
    def self.player_codemaker(players)
      #x = @mode.select {|key,value| value == "Codemaker"}
      #if x.keys = :Player
        # human_code
        puts "player codemaker"

        #Codemaker.comp_code(players)
      #end
    end
  
    
      def self.player_codebreaker(players)
    #   x = @mode.select {|key,value| value == "Codebreaker"} 
    #       if x.keys = :Player
    #     y = players.select {|key,value| key == :Player}
              puts "player codebreaker"
        #   else y = players.select {|key,value| key == :Computer}
        # comp_guess(y)
        #   end
      end
  
  

  
  end
  
  class Codemaker

    #   def human_code
    #       puts "Please select your code! Input 4 colour letters in your preferred order and separated by spaces. When you're ready, press Enter.\nThe colours are Red (R), Yellow (Y), Blue (B), Green (G), Orange (O), Purple (P)."
    #   input_code
    #   players[:Player] = @code
    #       puts "Great! Your secret code is #{players[:Player]}."
    #   end
  
        attr_accessor :players, :mode, :pegs, :colours 
      def self.comp_code(players, colours)
           puts "Computer is thinking of a code..."
           players[:Computer] = colours.sample(4)
        puts "*** Code selected! ***"
         p players[:Computer]
      end
  
  end
  
  class Codebreaker
  
    def self.input_code(colours)
        #puts "Input code"
        pass = false
        @code = gets.lstrip.chomp.upcase.split
        until pass == true do
            # p @code
            if (@code.length != 4) == true
                puts "Invalid input. Please only select 4 colour letters."
            elsif @code.all? {|x| colours.include?(x)} == false
                puts "Invalid input. Please input the colour letters provided: The colours are Red (R), Yellow (Y), Blue (B), Green (G), Orange (O), Purple (P)."
            else pass = true
                # p pass
                # p @code
                break
            end
            @code = gets.lstrip.chomp.upcase.split 
        end
    end
    
    def self.human_guess(players, colours)
       puts "Please input 4 colour letters in your preferred order and separated by a space:"
       input_code(colours)
       players[:Player] = @code
       #puts "human guess"
    #    p players[:Player]
    #    p players
     end
  
      #wip
      # def comp_guess(y)
    #   available_colours = ["B", "G", "O", "P", "R", "Y"]
    #   i = 0
    #   bagel =
    #   pico =
  
      # 	puts "Computer will make a guess..."
    #   p players[:Computer]
    #   p @pegs
    #   case players[:Computer]
  
    #   when i = 0
    #     4.times {@guess.push(colours[i])}
  
    #   when @pegs["bagel"] == 0 && @pegs["picos"] == 0
    #     @guess.map! {|g,gi| colours.index(g)+1}             #convert colours to colour index + 1
    #     @guess.map! do |g,gi| 
    #       if colours[g] == nil 
    #         colours[0] 
    #       else colours[g] 
    #       end
    #     end
  
    #   when @pegs["bagel"] == 0 && @pegs["picos"] == 0
  
    #   else
        
    #   end 
      # 	colours.sample(4)
    #       until 
      # end
  
  
  end