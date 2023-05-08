#select
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.select { |friend| friend != 'Brian' }
#=> ["Sharon", "Leo", "Leila", "Arun"]

responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}


#reject
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.reject { |friend| friend == 'Brian' }
#=> ["Sharon", "Leo", "Leila", "Arun"]


#each
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.each { |friend| puts "Hello, " + friend }
#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun
#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]

my_hash = { "one" => 1, "two" => 2 }
my_hash.each { |key, value| puts "#{key} is #{value}" }
one is 1
two is 2
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{pair}" }
the pair is ["one", 1]
the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}


#each and method
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
shouting_at_friends = []
friends.each { |friend| shouting_at_friends.push(friend.upcase) }
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
shouting_at_friends #=> ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN'] 


#map and bang(!)
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
friends
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`


#reduce
my_numbers = [5, 6, 7, 8]
my_numbers.reduce { |sum, number| sum + number }
#=> 26
#1. Iteration 0: sum = 5(default accumulator) + 6 = 11
#2. Iteration 1: sum = 11 + 7 = 18
#3. Iteration 2: sum = 18 + 8 = 26 

my_numbers = [5, 6, 7, 8]
my_numbers.reduce(1000) { |sum, number| sum + number }
#=> 1026

votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]
votes.reduce(Hash.new(0)) do |result, vote|
   result[vote] += 1
   result
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}
#Iteration 0:
#     result = {}
#     Remember, this hash already has default values of 0, so result["Bob's Dirty Burger Shack"] == 0 and result["St. Mark's Bistro"] == 0
# Iteration 1:
#     The method runs result["Bob's Dirty Burger Shack"] += 1
#     result = {“Bob’s Dirty Burger Shack” => 1}
# Iteration 2:
#     The method runs result["St. Mark's Bistro"] += 1
#     result = {“Bob’s Dirty Burger Shack” => 1, “St. Mark’s Bistro” => 1}
# Iteration 3:
#     The method runs result["Bob's Dirty Burger Shack"] += 1
#     result = {“Bob’s Dirty Burger Shack” => 2, “St. Mark’s Bistro” => 1}