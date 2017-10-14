
def my_min(arr)
  arr.each do |el|
      return el if arr.all?{|el2| el2>=el}
  end
end

def my_min_n(arr)
  min=arr[0]
  arr.each do |el|
    min=el if el<min
  end
  min
end


def largest_contiguous_subsum(arr)
  result = []
  arr.each_with_index do |num, idx1|
    result << [num]
    arr[idx1+1..-1].each_with_index do |num, idx2|
      result << arr[idx1..idx2+1+idx1]
    end
  end
  result.map! { |arr| arr.reduce(:+)}
  result.max
end

def largest_contiguous_subsum_n(arr)
  biggest_sum=arr[0]
  current_sum=arr[0]

  arr[1..-1].each do |el|
    if (current_sum+el<=0)
      current_sum=0
    elsif (biggest_sum<current_sum+el)
      biggest_sum=current_sum+el
      current_sum+=el
    else
      current_sum+=el
    end
  end
  biggest_sum
end

#is this actuallty n*n! space complexity?
 def anagram?( string,target  )
   permutations=string.chars.permutation.to_a
   permutations.include?(target.chars)
 end



def anagram2?(string, target)
  original=string.chars
  target_chars=target.chars
  string.chars.each do |string_char|
    original.delete(string_char)
    target_chars.delete(string_char)
  end
  return true if original.empty? && target_chars.empty?
  false
end

def anagram3?(string, target)
  return true if string.chars.sort==target.chars.sort
  false
end

def anagram4?(string,target)
  hash=Hash.new(0)
  string.chars.each do |char|
    hash[char]+=1
  end
  target.chars.each do |char|
    hash[char]-=1
  end

  hash.values.all?{|val| val==0}

end
puts anagram4?("gizmo", "sally")
puts anagram4?("elvis", "lives")
