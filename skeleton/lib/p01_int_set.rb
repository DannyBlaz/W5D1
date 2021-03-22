require "byebug"
class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max){Array.new}
  end

  def insert(num)
    is_valid?(num)
    if !self.include?(num)
      @store[num] = true
    else
      @store[num] = false
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true ? true : false
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > @max || num < 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    new_num = num % num_buckets
    if !self.include?(num)
      @store[new_num] << num
    end
  end

  def remove(num)
    new_idx = num % num_buckets
    @store.delete(@store[new_idx])
  end

  def include?(num)
    temp = false
    @store.each do |row|
      row.each do |ele|
        if num == ele
          temp = true
        end
      end
    end
    return temp
  end


 

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
     @store[num] 
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # debugger
    if !self.include?(num) && @count < num_buckets
      new_num = num % num_buckets
      # puts "#{@count} and #{num_buckets}"
      # puts "count is less than num_buckets"
      @store[new_num] << num
      @count += 1
    elsif @count >= num_buckets
      # debugger
      # puts "count is more than num_buckets"
      @store = resize!
      new_num = num % num_buckets
      @store[new_num] << num
      @count += 1
    end
  end
  
  def remove(num)
    if self.include?(num)
      new_idx = num % num_buckets
      @store[new_idx].delete(num)
      @count -= 1
    end
  end
  
  def include?(num)
    # puts "i am inside include"
    new_num = num % num_buckets
    @store[new_num].any? { |ele| ele == num }
  end
  
  def resize!
    # debugger
    # print @store
    old_arr = @store.flatten
      # p "--------"
    # print old_arr
    new_size = @store.length * 2
    new_arr = Array.new(new_size){Array.new}
    old_arr.each do |ele|
        # debugger
      new_idx = ele % new_size #num_buckect should be the new size
      new_arr[new_idx] << ele
    end
    new_arr
  end

  private

  def [](num)
    new_num = num % num_buckets
    @store[new_num]
  end

  def num_buckets
    @store.length
  end

end
