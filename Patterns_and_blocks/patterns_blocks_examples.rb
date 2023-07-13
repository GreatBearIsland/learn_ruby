Patterns
check out "https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html"








Block

Yield
yield is a keyword that can be called inside a method to relinquish execution to the accompanying block. Let’s imagine you’re writing a simple method for your library which allows users of that library to log some information to the terminal. The one key requirement you have is that users should be able to define how that information is presented.

def stats_method
    hash = {name: 'Terry', age: '28', favourite_colour: 'blue'}
    hash.each do |key, value|
        yield key, value
    end
end

#Run the method with a block {} that will format how to present the contents of the method
stats {|key, value| puts "#{key}: #{value}"}

#output
name: Terry
age: 28
favourite_colour: blue


Lambda
A lambda is a way to write a block and save it to a variable. This can be useful if you’re calling different methods but passing in the same block to each of them. It keeps you from having to type out the same code over and over again.
There are two ways to create a lambda. One is to use the lambda keyword e.g. lambda { "inside the lambda" }. The other way to declare a lambda is using the “stabby lambda” syntax, -> {}. This looks a little funky but you get used to it. Stabby lambda notation is more commonly used, so that’s what we’ll be using for the other examples.

Examples:
my_lambda = lambda { puts "my lambda" }
my_other_lambda = -> { puts "hello from the other side" }

Call Lambda:
my_lambda = -> { puts "high five" }
my_lambda.call
# => high five
or with an arguement:

my_name.call("tim")
my_name.("tim")
my_name["tim"]
my_name.=== "tim"

Adding arguments:
If you use the stabby lambda syntax -> then you use () to name your parameters. If you use the lambda keyword, then you use pipes || inside the block.
my_name = ->(name) { puts "hello #{name}" }
my_age = lambda { |age| puts "I am #{age} years old" }

my_name.call("tim")
#=> hello tim
my_age.call(78)
#=> I am 78 years old

Procs
A proc is just an object that you can use to store blocks and pass them around like variables. If you think this sounds a bit like a lambda, then you’d be right. In fact, there is no special lambda class. A lambda is actually just a type of proc object but with some distinct behaviors which we’ll cover shortly.

2 Examples(Proc.new or proc) add pipes || to add arguments:
a_proc = proc { puts "this is a proc" }
a_proc.call
#=> this is a proc

a_proc = Proc.new { |name, age| puts "name: #{name} --- age: #{age}" }
a_proc.call("tim", 80)
#=> name: tim --- age: 80

COMPARING LAMBDA AND PROC:

Proc doesnt care about meeting argument numbers. Will return nil if no argument provided.
a_proc = Proc.new { |a, b| puts "a: #{a} --- b: #{b}" }
a_proc.call("apple")
# => a: apple --- b:

Lambda does care if we dont honor the exact number of arguments provided.
a_lambda = lambda { |a, b| puts "a: #{a} --- b: #{b}" }
a_lambda.call("apple")
# => wrong number of Arguments (given 1, expected 2) (ArgumentError)
a_lambda.call("apple", "banana", "cake")
# => wrong number of Arguments (given 3, expected 2) (ArgumentError)

In contrast, as you can see, select has two arguments specified |a, b|, on each iteration we pass a single element of nested_array into the block. On the first iteration this is: [1, 2], this array now, is deconstructed automatically (into a = 1, b = 2) and its values compared as specified. So on to the next rounds of iteration in which we pass [3, 4] and [5, 6] one by one. This happens because the block {|a, b| if a + b > 10 } is treated as a non-lambda proc. This property is not limited to select but also applies to other enum methods like map, each etc. You can read more about this here: https://ruby-doc.org/core-3.1.2/Proc.html
nested_array = [[1, 2], [3, 4], [5, 6]]
nested_array.select {|a, b| a + b > 10 }
# => [5, 6]