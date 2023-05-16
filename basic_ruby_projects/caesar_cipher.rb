require 'pry-byebug'
# def caesar_cipher(string, key)
#     cipher = ()                       #ciphered string
#     sentence = string.split(" ").to_a       #convert sentence to an array of words
#     alphabet = ('a'..'z').to_a          #convert alphabet range into an array
#     looped = false
    
#     sentence.each do |word|
#         n = word.length
#         for l in 0..n
#             alphabet.each_with_index do |a, i| 
#                 if l = a 
#                     num = i + key
#                     if num > 26
#                        num = num - 26
#                        looped = true
#                     else
#                         looped = false
#                     end
#                 letter = alphabet[num]
#                 cipher.insert(-1, letter)
#                 p i
#                 p key
#                 p num
#                 p letter
#                 p looped
#                 p cipher
#                 end
#             end
#         end
#         cipher.push(" ")
#         p cipher
#     end     
#   end
#   caesar_cipher('I am a dog',1)




def caesar_cipher(string, key)
    cipher = ""                          #ciphered string
    alphabet = ('a'..'z').to_a              #convert alphabet range into an array
    looped = false  

    n = string.length
    string.chars
    for i in 0..n-1 do                         #assign each letter an index
        if i == (" ")
            cipher.insert(" ")
            p cipher
            binding.pry
        else 
            alphabet.each {|a| 
                if i == a 
                    num = i + key
                    if num > 26
                        num = num - 26
                        looped = true
                    else
                        looped = false
                    end
                    letter = alphabet[num]
                    cipher + letter
                    p i
                    p key
                    p num
                    p letter
                    p looped
                    p cipher
                end}
        end
    end
    puts "Expecting #{cipher}"
end     

caesar_cipher('I am a dog',1)