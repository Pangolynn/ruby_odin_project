# Cases:
# x + shift > 122 (z) wrap
# x + shift is < 97 (a) wrap
# x isnt a letter - return original
# x + shift is between 97 & 122
# Uppercase and lowercase
# 65 - 90 A - Z
# 97 - 122 a - z



# def caesar_cipher(str, shift)
#    arr = str.split('')
#    arr = arr.map do |x| 
#     if x.ord > 122 || x.ord < 97 
#         p x.ord
#         x #return whatever non a-z character this was
#     elsif x.ord + shift > 122 
#         p "xshift is > 122 #{x}"
#         # start back at a, remove one from shift since we started over
#         x = x.ord + shift - 26
#         x.chr #turn back into char
        

#     elsif x.ord + shift < 97
#         p "xshift is < 97"
#         x = x.ord + shift + 26
#         x.chr
#     else 
#         p 'xshift is < 122'
#         (x.ord + shift).chr 
#     end 
#    end
#    p arr.join()
# end

def caesar_cipher(str, shift)
    arr = str.split('')
    arr = arr.map do |x| 
    if x.ord >= 65 && x.ord <= 90 
        if x.ord + shift > 90 
         p "xshift is > 90 #{x}"
         # start back at a, remove one from shift since we started over
         x = x.ord + shift - 26
         x.chr #turn back into char 

        elsif x.ord + shift < 65
         p "xshift is < 65"
         x = x.ord + shift + 26
         x.chr
        else 
         (x.ord + shift).chr 
        end 
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
    else
        p x.ord
        x #return whatever non a-z character this was
    end
end
    p arr.join()
end


# dec = caesar_cipher("abc wxyz", 2)
# caesar_cipher(dec, -2)

two = caesar_cipher("A!~az Z 110for the win!`", -3)
 caesar_cipher(two, 3)

