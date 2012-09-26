file = ""

File.readlines("gettysburg.txt").each do |line|
    file << line
end

@longest_substring = ""

0.upto(file.length - 1) do |left_hand_index|  
  (file.length - 1).downto(0) do |right_hand_index|    
    substring = file[left_hand_index, right_hand_index]    
    if substring == substring.reverse
      if substring.length > @longest_substring.length
        @longest_substring = substring
      end
    end
  end
  @longest_substring
end

p "Answer is: #{@longest_substring}"