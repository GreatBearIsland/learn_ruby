require './mmb_player'

class Game
	
	def initialize
		@players = {Player: [], Computer: []}
		#@mode = {1 => "Code Maker", 2 => "Code Breaker"}
        @colours = ["B", "G", "O", "P", "R", "Y"]
        @round = 0
		@game_over = false
		run
	end
    attr_reader :players, :pegs

	def run
        space_break
		puts "***** Let's play Mastermind! *****"
        puts "Rules: You are the guesser and you are trying to guess the Computer's secret colour code.\nYou will select a combination of 4 colours, separated by spaces, and will recieve a number of bagels 'Correct colour and position' or a number of picos 'Correct colour but not position'.\nYou have 12 rounds to beat the Computer.\nThe colours are Red (R), Yellow (Y), Blue (B), Green (G), Orange (O), Purple (P). Good Luck!"
		puts "*******************************************************************************"
        #select_mode
        space_break
        Codemaker.comp_code(@players, @colours)
		rounds
        space_break
		puts "Game over. Play again?"
	end


	# def select_mode
	# 		puts "Player select if you want to be the Code Maker (1) or Code Breaker (2)."
	# 		mode_selection = gets.chomp.to_i
	# 		until @mode.keys.include?(:Player) == true do
	# 			puts "Invalid input. Please input either '1' for Code Maker or '2' for Code Breaker"
	# 			mode_selection = gets.chomp.to_i
	# 			if
					
	# 			mode_selection == 1
	# 			 @mode={Player: "Codemaker", Computer: "Codebreaker"}
	# 			else
	# 			 @mode={Player: "Codebreaker", Computer: "Codemaker"}
	# 			end
	# 		return "Great! You are the #{@mode[:Player]} and the Computer is the #{@mode[:Computer]}"
	# 	end
	# end


	#working on irb but not ruby run
# 	def select_mode
# 		puts "Player select if you want to be the Code Maker (1) or Code Breaker (2)."
# 		mode_selection = gets.chomp.to_i
# 		until @mode.keys.include?(:Player) == true do
# 			case
# 			when mode_selection == 1
# 			 @mode={Player: "Codemaker", Computer: "Codebreaker"}
# 			when mode_selection == 2 
# 			 @mode={Player: "Codebreaker", Computer: "Codemaker"}
# 			else 
# 				puts "Invalid input. Please input either '1' for Code Maker or '2' for Code Breaker"
# 				mode_selection = gets.chomp.to_i
# 			end
# 		end
# 		return "Great! You are the #{@mode[:Player]} and the Computer is the #{@mode[:Computer]}"
# end


	def rounds
		until @game_over == true do
			@round += 1
            space_break
			puts "**** Guess #{@round} ****"
			Codebreaker.human_guess(@players, @colours)
			checker(players)
			game_over?
		end
	end


	#wip - need testing
	def checker(players)
    pegs = {"bagels": 0,"picos": 0}
    tally = @players[:Computer].tally
		# @mode[:Player] == "Codemaker"
		# puts "Guess seq. #{@players[:Player]}"
    if (@players[:Player] & @players[:Computer]).empty? == false
      bagels(pegs, tally) 
    # puts "bagels: #{pegs[:bagels]}"
    end
    picos(pegs, tally) 
    # puts "tally: #{tally}"
		#end
		#p @pegs
		puts "Bagel: #{pegs[:bagels]} (correct colour and position)\nPicos: #{pegs[:picos]} (correct colour, wrong position)"
	end


  def bagels(pegs, tally)
    index = 0
    # puts "Bagels"
    # p @players[:Player] 
    # p @players[:Computer] 
    for x in @players[:Computer] 
      # p @players[:Player][index]
      # p x
      if tally[@players[:Player][index]] != 0 && (@players[:Player][index] == x) == true 
        tally[@players[:Player][index]]-=1 
        pegs[:bagels]+=1 
        # puts "Correct"
        # puts "tally: #{tally}"
      end
      index +=1
    end
  end



    # def bagels(pegs, tally, index)
    #     return if (@players[:Player] & @players[:Computer]).empty? && tally[@players[:Player][index]] > 0
    #     if (@players[:Player][index] == x) == true
    #       tally[@players[:Player][index]]-=1 
    #       pegs[:bagels]+=1 
    #       puts "Correct"
    #       puts "tally: #{tally[@players[:Player][index]]}"
    #       p @players[:Player][index]
		#       p x
    #     else
    #     end
    # end

    def picos(pegs, tally)
      index = 0
      # puts "Picos"
      # p @players[:Player] 
      # p @players[:Computer] 
      for x in @players[:Computer] 
        # p @players[:Player][index]
        # p x
        if tally[@players[:Player][index]] != 0 && @players[:Computer].include?(@players[:Player][index])
          tally[@players[:Player][index]]-=1
          pegs[:picos]+=1 
          # puts "Correct colour but wrong position"
          # puts "tally: #{tally}"
        end
        index +=1
      end
    end



	def game_over?
		if (@players[:Computer] == @players[:Player]) == true
			# puts "***** #{@mode.key("Codebreaker").to_s} won! *****" 
            puts "***** Congratulations ~ You win! *****"  
			@game_over = true
        elsif @round == 6 && (@players[:Computer] != @players[:Player]) == true
			# puts "***** #{@mode.key("Codemaker").to_s} won! *****"
            puts "***** Hard luck, Computer wins. Better luck next time *****" 
			@game_over = true 
        else 
		end
	end


    def space_break
        puts " "
    end

end


Game.new