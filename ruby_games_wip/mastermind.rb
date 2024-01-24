require './mm_player'

class Game
	attr_accessor :players, :mode, :pegs
	def initialize
		@players = {Player: [], Computer: []}
		@mode = {1 => "Code Maker", 2 => "Code Breaker"}
		@pegs = {"bagels": 0,"picos": 0}
		@game_over = false
		run
	end


	def run
		puts "***** Let's play Mastermind! *****"
		select_mode
		p @mode
		Player.player_codemaker(@mode)
		rounds
		puts "Game over. Play again?"
	end


	def select_mode
			puts "Player select if you want to be the Code Maker (1) or Code Breaker (2)."
			mode_selection = gets.chomp.to_i
			until @mode.keys.include?(:Player) == true do
				puts "Invalid input. Please input either '1' for Code Maker or '2' for Code Breaker"
				mode_selection = gets.chomp.to_i
				if
					
				mode_selection == 1
				 @mode={Player: "Codemaker", Computer: "Codebreaker"}
				else
				 @mode={Player: "Codebreaker", Computer: "Codemaker"}
				end
			return "Great! You are the #{@mode[:Player]} and the Computer is the #{@mode[:Computer]}"
		end
	end


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
		while game_over == true do
			round += 1
			puts "Guess #{round}:"
			Player.player_codebreaker(@players)
			checker
			game_over?
		end
	end


	#wip - need testing
	def checker
		index = 0
		# @mode[:Player] == "Codemaker"
		puts "Guess seq. #{@players[:Codebreaker]}"
			for x in @players[:Codemaker] 
				# puts "Index: #{index}"
				# puts "Correct seq. #{@players[:Codemaker]}"
				if (@players[:Codebreaker][index] == x) == true
					@pegs[:bagels]+=1
					puts "Correct"
					# p x
					# p @players[:Codebreaker][index]
					# p @pegs[:bagels]
				elsif @players[:Codemaker].include?(@players[:Codebreaker][index]) 
					@pegs[:picos]+=1
					puts "Correct colour but wrong position"
					# p x
					# p @players[:Codebreaker][index]
					# p @pegs[:picos]
				end
				index +=1
			end
		#end
		p @pegs
		puts "There are #{@pegs[:bagels]} that are the correct colour and position,\nbut #{@pegs[:picos]} that are the correct colour but in the wrong position."
	end


	def game_over?
		if (@players[:Codemaker] == @players[:Codebreaker]) == true
			puts "***** #{@mode.key("Codebreaker").to_s} won! *****" 
			@game_over = true
		else (@players[:Codemaker] != @players[:Codebreaker]) == true && round == 13
			puts "***** #{@mode.key("Codemaker").to_s} won! *****"
			@game_over = true 
		end
	end

end


Game.new