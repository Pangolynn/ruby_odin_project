# The Odin Project 'Substrings' Project

# Implement a method #substrings that takes a word as the
# first argument and then an array of valid substrings (your dictionary)
# as the second argument.
# Return a hash listing of each substring (case insenstive) that was
# found in the original string and how many times it was found

# arrays into string and strings into arrays




def substrings(str, dict) 
    a = str.split
    results = Hash.new(0)

    a.each do |x|
        dict.each do |y|
            if x.downcase.include? y.downcase
                results[y] +=1
            end

        end
    end

    p results
end



