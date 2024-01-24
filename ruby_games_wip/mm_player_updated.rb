class Player
  
  def self.input_code(colours, code)
      #puts "Input code"
      pass = false
      @code = gets.lstrip.chomp.upcase.split
      until pass do
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

end
  

  
  class Codemaker < Player
    attr_accessor :players, :mode, :colours, :code 

    public
      def self.codemaker_nav(players, mode, colours)
        # puts "player codemaker"
        x = mode.select {|key,value| value == "Codemaker"}
        # p x
        # p y
        if x.keys == [:Player]
          human_code(players, colours)
        else
          comp_code(players, colours)
        end
      end

      attr_accessor :code
      def self.human_code(players, colours)
        # puts "human code"
        puts "What's your secret code?"
        input_code(colours, @code)
        # p players
        # p @code
        players[:Player] = @code
        puts "Great! Your secret code is #{players[:Player].join(" ")}.\nLet's see if the Computer can figure it out..."
        # p players
      end
  
      
      def self.comp_code(players, colours)
        puts "Computer is thinking of a code..."
        sleep(4)
        players[:Computer] = colours.sample(4)
        puts "*** Code selected! ***"
        p players[:Computer]
      end
  
  end
  
  class Codebreaker < Player
    attr_accessor :players, :mode, :colours, :code

    def self.codebreaker_nav(players, mode, colours)
      # puts "player codebreaker"
      x = mode.select {|key,value| value == "Codebreaker"} 
      # p x
      # p players
      if x.keys == [:Player]
        human_guess(players, colours)
      else
        comp_guess(players, colours)
      end
        end
  
    
    def self.human_guess(players, colours)
       #puts "human guess"
      puts "Please input your guess separated by a spaces:"
      input_code(colours, @code)
      players[:Player] = @code
    #    p players[:Player]
    #    p players
     end
  
      
      def self.comp_guess(players, colours)
        puts "Computer will make a guess..."
        sleep(2)
        # players[:Computer] = ["R","R","R","R"] 
        players[:Computer] = colours.sample(4)
        puts "Computer guessed #{players[:Computer].join(" ")}" 
      end

      #wip1
      # def self.comp_guess(players, colours) 
      # available_colours = ["B", "G", "O", "P", "R", "Y"]
      # i = 0
      # bagel =
      # pico =
        # puts "comp guess"
      	
      # p players[:Computer]
      # p @pegs
      # case players[:Computer]
  
      # when i = 0
      #   4.times {@guess.push(colours[i])}
  
      # when @pegs["bagel"] == 0 && @pegs["picos"] == 0
      #   @guess.map! {|g,gi| colours.index(g)+1}             #convert colours to colour index + 1
      #   @guess.map! do |g,gi| 
      #     if colours[g] == nil 
      #       colours[0] 
      #     else colours[g] 
      #     end
      #   end
  
      # when @pegs["bagel"] == 0 && @pegs["picos"] == 0
  
      # else
        
      # end 
      # 	colours.sample(4)
      #     until 
      # end





      #wip2
      # def self.comp_guess(players, colours) 
      # round = 1
      # case
      #   colours = ["B", "G", "O", "P", "R", "Y"]
      #   potential_colours = []
        
      #   i = 0
      #   total = @pegs["bagel"] + @pegs["picos"]
      # when round == 1
      #   2.times {@guess.push(colours[i])} 
      #   2.times {@guess.push(colours[i+1])}  

      #   when round > 1 && total >= 1
      #     2.times {@guess.push(colours[i])} 
      #     2.times {@guess.push(colours[i+1])}  



      #   when @pegs["bagel"] >= 1
      #     x

      #   when

      # end

      # def evaluate_pegs()
      # end

      # end
  end