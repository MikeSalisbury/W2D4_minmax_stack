def windowed_max_range(arr, w)
  val=0
  arr[0..arr.length-w].each_index do |i|
    temp=arr[i...i+w]
    val=temp.max-temp.min if (temp.max-temp.min)> val
  end
  val
end
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue(el)
    @store.shift(el)
  end
end

class MyStack
  def initialize
    @store = []
    @max=nil
    @min=nil
  end
  def max
    @max
  end
  def push(el)
    @max=el if el>@max || @max.nil?
    @min=el if el<@min || @min.nil?
    @store.push(el)
  end
  def pop
    @store.pop
  end
end

class MyStackQueue
  def initialize
    @store = []
  end
  def enqueue(el)
    @store.push(Mystack.new.push(el))
  end

  def dequeue
    @store.shift.pop
  end
end
