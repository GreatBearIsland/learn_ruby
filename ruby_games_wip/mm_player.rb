
class Player
  @colours = ["B", "G", "O", "P", "R", "Y"]
  
  public
  def self.player_codemaker(mode)
    x = @mode.select {|key,value| value == "Codemaker"}
    if x.keys = :Player
      human_code
    else puts "comp_code"
    end
  end

  public
	def self.player_codebreaker(mode)
    x = @mode.select {|key,value| value == "Codebreaker"} 
		if x.keys = :Player
      y = @players.select {|key,value| key == :Player}
			human_guess(y)
		else y = @players.select {|key,value| key == :Computer}
      comp_guess(y)
		end
	end


	def input_code
    puts "Input code"
		@code = gets.chomp.upcase.split
			if (@code.length == 4) == false
				puts "Invalid input. Please only select 4 colour letters."
			elsif @code.all? {|x| @colours.include?(x)} == false
				puts "Invalid input. Please input the colour letters provided: The colours are Red (R), Yellow (Y), Blue (B), Green (G), Orange (O), Purple (P)."
			end
	end

end

class Codemaker < Player

	def human_code
		puts "Please select your code! Input 4 colour letters in your preferred order and separated by spaces. When you're ready, press Enter.\nThe colours are Red (R), Yellow (Y), Blue (B), Green (G), Orange (O), Purple (P)."
    input_code
    @players[:Player] = @code
		puts "Great! Your secret code is #{@players[:Player]}."
	end

	def comp_code(players)
	 	puts "Computer will now select a secret code!\nComputer is thinking..."
	 	@players[:Computer] = @colours.sample(4)
	  puts "Code selected!"
   	p @players[:Computer]
	end

end

class Codebreaker < Player

  def human_guess(y)
     puts "Please input your guess!\nRemember: Input 4 colour letters in your preferred order and separated by spaces. When you're ready, press Enter.\nThe colours are Red (R), Yellow (Y), Blue (B), Green (G), Orange (O), Purple (P)."
     input_code
     @players[:Player] = @code
   end

	#wip
	# def comp_guess(y)
  #   available_colours = ["B", "G", "O", "P", "R", "Y"]
  #   i = 0
  #   bagel =
  #   pico =

	# 	puts "Computer will make a guess..."
  #   p @players[:Computer]
  #   p @pegs
  #   case @players[:Computer]

  #   when i = 0
  #     4.times {@guess.push(@colours[i])}

  #   when @pegs["bagel"] == 0 && @pegs["picos"] == 0
  #     @guess.map! {|g,gi| @colours.index(g)+1}             #convert colours to colour index + 1
  #     @guess.map! do |g,gi| 
  #       if @colours[g] == nil 
  #         @colours[0] 
  #       else @colours[g] 
  #       end
  #     end

  #   when @pegs["bagel"] == 0 && @pegs["picos"] == 0

  #   else
      
  #   end 
	# 	@colours.sample(4)
  #       until 
	# end


end