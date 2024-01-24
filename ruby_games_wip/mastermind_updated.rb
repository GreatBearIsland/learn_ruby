require './mm_player_updated'

class Game
	
	def initialize
		@players = {Player: [], Computer: []}
		@mode = {1 => "Code Maker", 2 => "Code Breaker"}
    @colours = ["B", "G", "O", "P", "R", "Y"]
    @round = 0
		@game_over = false
		run
	end
    attr_reader :players, :mode, :colours

	def run
    space_break
		puts "********** Let's play Mastermind! **********"
    puts "Rules: The Codebreaker will try to guess the Codemaker's secret colour code.\nThe Codebreaker will select a combination of 4 colours, which are separated by spaces, and will be marked by number of bagels 'Correct colour and position' and picos 'Correct colour but not position'.\nYou have 6 rounds to beat the Computer.\nThe colours are Red (R), Yellow (Y), Blue (B), Green (G), Orange (O), Purple (P). Good Luck!"
		puts "**************************************************************************************"
		space_break  
		select_mode
    space_break
    Codemaker.codemaker_nav(@players, @mode, @colours)
		rounds
    space_break
		puts "Game over. Play again?"
	end


	def select_mode
    puts "Do you want to be the Codemaker (1) or Codebreaker (2)?"
		mode_selection = gets.chomp.to_i
		until @mode.keys.include?(:Player) do
			if mode_selection == 1
				@mode={Player: "Codemaker", Computer: "Codebreaker"}
			elsif mode_selection == 2
				@mode={Player: "Codebreaker", Computer: "Codemaker"}
			else 		
				puts "Invalid input. Please input either '1' for Codemaker or '2' for Codebreaker"
				mode_selection = gets.chomp.to_i	
			end
		end
		puts  "Awesome! You are the #{@mode[:Player]} and the Computer is the #{@mode[:Computer]}"
	end


	def rounds
		until @game_over do
			@round += 1
      space_break
			puts "**** Guess #{@round} ****"
			Codebreaker.codebreaker_nav(@players, @mode, @colours)
			# p @players
			# p @mode
			checker(@players)
			space_break
			game_over?
		end
	end


	def checker(players)
		assign
    pegs = {"bagels": 0,"picos": 0}
    tally = @m.values[0].tally
		# p @m.values[0]
    if (@m.values[0] & @b.values[0]).empty? == false
      bagels(pegs, tally) 
    end
    picos(pegs, tally) 
    # puts "tally: #{tally}"
		puts "Bagel: #{pegs[:bagels]} (correct colour and position)\nPicos: #{pegs[:picos]} (correct colour, wrong position)"
	end


	def assign
		#assign codemaker hash
			x = @mode.select {|key,value| value == "Codemaker"}
			@m = @players.select {|key,value| key == x.key("Codemaker")} 
		#assign codebreaker hash
			y = @mode.select {|key,value| value == "Codebreaker"} 
			@b = @players.select {|key,value| key == y.key("Codebreaker")} 
	end


  def bagels(pegs, tally)
    index = 0
    # puts "Bagels"
    # p @players[:Player] 
    # p @players[:Computer] 
    for x in @m.values[0] 
      # p @b.values[0][index]
      # p x
      if tally[@b.values[0][index]] != 0 && (@b.values[0][index] == x) == true 
        tally[@b.values[0][index]]-=1 
        pegs[:bagels]+=1 
        # puts "Correct"
        # puts "tally: #{tally}"
      end
      index +=1
    end
  end


    def picos(pegs, tally)
      index = 0
      # puts "Picos"
      # p @players[:Player] 
      # p @players[:Computer] 
      for x in @m.values[0]					#use iterator  (each)
        # p @b.values[0][index]
        # p x
        if tally[@b.values[0][index]] != 0 && @m.values[0].include?(@b.values[0][index])
          tally[@b.values[0][index]]-=1
          pegs[:picos]+=1 
          # puts "Correct colour but wrong position"
          # puts "tally: #{tally}"
        end
        index +=1
      end
    end



	def game_over?
		case 
		when(@m.values[0] == @b.values[0]) == true 
			if @mode.key("Codebreaker") == :Player
				puts "***** Congratulations ~ You win! *****"	
			else
				puts "***** Hard luck, Computer wins. Better luck next time *****" 	
			end
			@game_over = true
		when @round == 6 && (@m.values[0] != @b.values[0]) == true
			if @mode.key("Codemaker") == :Player
				puts "***** Congratulations ~ You win! *****"	
			else
				puts "***** Hard luck, Computer wins. Better luck next time *****" 	
			end
			@game_over = true
		end
	end


    def space_break
        puts " "
    end

end


Game.new