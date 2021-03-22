class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0 if self.empty?
    num = 0
    #self.last.hash
    self.each.with_index do |ele, i|
      num += (ele ^ i)
    end
    num.hash
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
