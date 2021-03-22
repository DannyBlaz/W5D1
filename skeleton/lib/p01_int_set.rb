class MaxIntSet
  def initialize(max)
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
    
  end

  private

  def is_valid?(num)
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
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
