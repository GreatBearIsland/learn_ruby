def caesar_cipher(string, key)
  cipher = [].to_str                      #ciphered array into a string
  sentence = string.split(" ").to_a       #convert sentence to an array of words
  alphabet = ('a'..'z').to_a          #convert alphabet range into an array
  looped = false
  
  sentence.each do |word|
      n = word.length
      for l in 0..n
          alphabet.each_with_index do |a, i| 
              if l = a 
                  num = i + key
                  if num > 26
                     num = num - 26
                     looped = true
                  else
                      looped = false
                  end
              letter = alphabet(num)
              cipher.push(letter)
              p i
              p key
              p num
              p letter
              p looped
              p cipher
              end
          end
      end
      cipher.push(" ")
      p cipher
  end     
end
