#Time Complexity=N^2 space complexity=1
def bad_two_sums(arr, target)
  arr.each_with_index do |el, i|
    arr[i+1..-1].each do |el2|
      return true if el+el2==target
    end
  end
  false
end

#Time Complexity=Nlog(N) space complexity=n
def okay_two_sums(arr, target)
  array=arr.sort
    array.each do |i|
      return true if array.bsearch{|x| x==target-i}
    end
    false

end
#Time Complexity=N space complexity=n
def two_sums(arr,target)
  counter={}
  arr.each do |el|
    counter[el]=true
  end
  arr.each do |i|
    return true if counter[target-i]
  end
  false
end

p two_sums([1,6,4,10], 13)
p two_sums([1,2,3,4], 8)
