#Nested Arrays
test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
]

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]


#accessing elements
 teacher_mailboxes[0][0]
 #=> "Adams"
 teacher_mailboxes[1][0]
 #=> "Jones"
 teacher_mailboxes[2][0]
 #=> "Perez"
 teacher_mailboxes[0][-1]
 #=> "Davis"
 teacher_mailboxes[-1][0]
 #=> "Perez"
 teacher_mailboxes[-1][-2]
 #=> "Smith"
#If you try to access an index of a nonexistent nested element, it will raise an NoMethodError, because the nil class does not have a [] method.
 teacher_mailboxes[3][0]
 #=> NoMethodError
 teacher_mailboxes[0][4]
 #=> nil


#dig
 #This method can also be used when accessing a nonexistent index inside of an existing nested element.
 teacher_mailboxes.dig(3, 0)
 #=> nil
 teacher_mailboxes.dig(0, 4)
 #=> nil


#Create new nested array
 mutable = Array.new(3, Array.new(2))
 #=> [[nil, nil], [nil, nil], [nil, nil]]
 mutable[0][0] = 1000
 #=> 1000
 mutable
 #=> [[1000, nil], [1000, nil], [1000, nil]]

 immutable = Array.new(3) { Array.new(2) }
 #=> [[nil, nil], [nil, nil], [nil, nil]]
 immutable[0][0] = 1000
 #=> 1000
 immutable
 #=> [[1000, nil], [nil, nil], [nil, nil]]


#adding elements
 test_scores << [100, 99, 98, 97]
 #=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
 test_scores[0].push(100)
 #=> [97, 76, 79, 93, 100]
 test_scores
 #=> [[97, 76, 79, 93, 100], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]


#removing elements
 test_scores.pop
 #=> [100, 99, 98, 97]
 test_scores[0].pop
 #=> 100
 test_scores
 #=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]


#iterating nested array
1.
 teacher_mailboxes.each_with_index do |row, row_index|
    puts "Row:#{row_index} = #{row}"
  end
  #=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
  #=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
  #=> Row:2 = ["Perez", "Scott", "Smith", "Young"]
  #=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]

  2.
  teacher_mailboxes.each_with_index do |row, row_index|
    row.each_with_index do |teacher, column_index|
      puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
    end
  end
  #=> Row:0 Column:0 = Adams
  #=> Row:0 Column:1 = Baker
  #=> Row:0 Column:2 = Clark
  #=> Row:0 Column:3 = Davis
  #=> Row:1 Column:0 = Jones
  #=> Row:1 Column:1 = Lewis
  #=> Row:1 Column:2 = Lopez
  #=> Row:1 Column:3 = Moore
  #=> Row:2 Column:0 = Perez
  #=> Row:2 Column:1 = Scott
  #=> Row:2 Column:2 = Smith
  #=> Row:2 Column:3 = Young
  #=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]

  3.
  teacher_mailboxes.flatten.each do |teacher|
    puts "#{teacher} is amazing!"
  end
  #=> Adams is amazing!
  #=> Baker is amazing!
  #=> Clark is amazing!
  #=> Davis is amazing!
  #=> Jones is amazing!
  #=> Lewis is amazing!
  #=> Lopez is amazing!
  #=> Moore is amazing!
  #=> Perez is amazing!
  #=> Scott is amazing!
  #=> Smith is amazing!
  #=> Young is amazing!
  #=> ["Adams", "Baker", "Clark", "Davis", "Jones", "Lewis", "Lopez", "Moore", "Perez", "Scott", "Smith", "Young"]

 1. 
 test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
 #=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
 test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
 end
 #=> false
 #It returns false, because none of the nested arrays have scores that are all over 80.

 2.
 test_scores.all? do |scores|
    scores.any? { |score| score > 80 }
  end
  #=> true
  #Now it is determining if all of the nested arrays contain any number over 80. 
  #This returns true, because each of the nested arrays have at least one number over 80.






#Nested Hashes
vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}

#assessing data
 vehicles[:alice][:year]
 #=> 2019
 vehicles[:blake][:make]
 #=> "Volkswagen"
 vehicles[:caleb][:model]
 #=> "Accord"
 vehicles[:zoe][:year]
 #=> NoMethodError
 vehicles.dig(:zoe, :year)
  #=> nil
 vehicles[:alice][:color]
 #=> nil
 vehicles.dig(:alice, :color)
 #=> nil


#adding and removing data
 vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}
 #=> {:year=>2021, :make=>"Ford", :model=>"Escape"}
 vehicles
 #=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

 vehicles.delete(:blake)
 #=> {:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}
 vehicles
 #=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}
 vehicles[:dave].delete(:color)
 #=> "red"
 vehicles
 #=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}


 #methods - Let’s say that we want to know who owns vehicles that are from 2020 or newer
1. vehicles.select { |name, data| data[:year] >= 2020 }
 #=> {:caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
 #using #select gives us the information that we need. However, what if we only want the names of the owners and not another nested hash.
2. vehicles.collect { |name, data| name if data[:year] >= 2020 }
 #=> [nil, :caleb, :dave]
 #when the if statement is false, it will return a nil value (as alice does not have one) but Nil values can cause problems down the road
3. vehicles.collect { |name, data| name if data[:year] >= 2020 }.compact
 #=> [:caleb, :dave] 
 #The #compact method returns an array (or hash) without nil values
4. vehicles.filter_map { |name, data| name if data[:year] >= 2020 }
 #=> [:caleb, :dave]vehicles.filter_map { |name, data| name if data[:year] >= 2020 }
 #=> [:caleb, :dave]
