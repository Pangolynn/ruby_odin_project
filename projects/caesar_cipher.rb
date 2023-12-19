# Cases:
# x + shift > 122 (z) wrap
# x + shift is < 97 (a) wrap
# x isnt a letter - return original
# x + shift is between 97 & 122
# x + shift is between 65 & 90
# Uppercase and lowercase
# 65 - 90 A - Z
# 97 - 122 a - z

def caesar_cipher(str, shift)
    arr = str.split('')
    arr = arr.map do |x| 
    # Uppercase letter    
    if x.ord >= 65 && x.ord <= 90 
        if x.ord + shift > 90 
        #  p "xshift is > 90 #{x}"
         x = x.ord + shift - 26
         x.chr 

        elsif x.ord + shift < 65
        #  p "xshift is < 65"
         x = x.ord + shift + 26
         x.chr
        else 
         (x.ord + shift).chr 
        end 
    # Lowercase Letter
    elsif x.ord >= 97 && x.ord <= 122
        if x.ord + shift > 122
           x = x.ord + shift - 26
           x.chr
        elsif x.ord + shift < 97
            x = x.ord + shift + 26
            x.chr
        else 
            (x.ord + shift).chr
        end
    # Not a letter
    else
        p x.ord
        x 
    end
end
    p arr.join()
end

# Tests
# c = caesar_cipher("A!~az Z 110for the win!`", -3)
# caesar_cipher(c, 3)

