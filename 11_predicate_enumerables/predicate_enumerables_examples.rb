#include?
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = friends.select { |friend| friend != 'Brian' }
invited_list.include?('Brian')
#=> false


#any?
numbers = [21, 42, 303, 499, 550, 811]
numbers.any? { |number| number > 500 }
#=> true
numbers.any? { |number| number < 20 }
#=> false


#all?
fruits = ["apple", "banana", "strawberry", "pineapple"]
 #to check whether all the words in our list are more than 6 characters long. 
 #NB #all? will return true by default unless the block returns false or nil.
fruits.all? { |fruit| fruit.length > 3 }
#=> true
fruits.all? { |fruit| fruit.length > 6 }
#=> false


#none?
fruits = ["apple", "banana", "strawberry", "pineapple"]
fruits.none? { |fruit| fruit.length > 10 }
#=> true
fruits.none? { |fruit| fruit.length > 6 }
#=> false

