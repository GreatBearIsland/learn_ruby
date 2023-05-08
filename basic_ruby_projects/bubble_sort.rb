require 'pry-byebug'
def bubble_sort(array)
    sorted_array=[]                     #new sorted array variable
    n = array.length                    #find the length of array
    rounds = array.length-1             #to indicate the number of times looping through the array
    false_count = 0                     #counts number of no changes within array
    changed = false                     #variable to flag if array was changed
    while rounds > 0                    #limiting the number of time looping through the array 
        for i in 0..n-1                 #loop though each pair of the array n times (which is the number of elements -1) within this range
            if array[i+1]!= nil && array[i] > array[i+1]  #check if last number is nil (to start new round) and if number is larger than the next number
                array[i], array[i+1] = array[i+1],array[i]  #swap
                changed = true          #flag that numbers were changed
            else
                changed = false         #flag that numbers weren't changed
                count += 1     
                if count == n 
                    rounds = 0 
            end
                p changed
                p i
                p n
                p rounds
                p count
                p count == n
                p array
            end
        end
        rounds -= 1         #minus one round of the array
        n = n-1             #after sorting largest number, removing number of iterations in array for quicker evaluation
        count = 0           #restart count
        # p rounds
    end
    #test class
    sorted_array = array
    puts "Sorted array #{sorted_array}"
    puts "Expecting #{array.sort}"
    if sorted_array = array.sort
        puts sorted_array == array
        put
    else 
        puts "Try again"
    end
end
#bubble_sort([4,3,78,2,0,2])
#bubble_sort([6,5,4,3,2,1])
#bubble_sort([0,300,78,2,0,40,60])
#bubble_sort([1,3,78,2,1,2,1])
bubble_sort([1,2,3,4,78,5])