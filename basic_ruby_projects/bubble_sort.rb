def bubble_sort(array)
    sorted_array=[]                         #new sorted array variable
    n = array.length                        #find the length of array
    rounds = array.length-1                 #to indicate the number of times looping through the array
    false_count = 0                         #counts number of no changes within array
    while rounds > 0                        #limiting the number of time looping through the array
        for i in 0..n-1                     #loop though each pair of the array n times (which is the number of elements -1) within this range
            break if array[i+1] == nil 

            if false_count == n             ##testing failed scenario - remove '='
                rounds = 0
                break
            end
            false_count += 1                  #increase false count 
            next if array[i] <= array[i+1]    #if number is larger than the next number
                array[i], array[i+1] = array[i+1],array[i]  #swap

              p i
              p n
              p rounds
              p false_count
              p array
        end
        rounds -= 1                         #minus one round of the array
        n -= 1                              #after sorting largest number, removing number of iterations in array for quicker evaluation
        false_count = 0                     #restart count
        # p rounds
    end
    #testing
    sorted_array = array                    #save array into sorted_array variable
    puts "Sorted array #{sorted_array}"
    puts "Expecting #{array.sort}"
    if sorted_array == array.sort        
        puts "Matched"
    else
        puts "Try again"
    end
end
#bubble_sort([4,3,78,2,0,2])
#bubble_sort([6,5,4,3,2,1])
#bubble_sort([0,300,78,2,0,40,60])
bubble_sort([1,3,78,2,1,2,1])
#bubble_sort([1,2,3,4,78,5])