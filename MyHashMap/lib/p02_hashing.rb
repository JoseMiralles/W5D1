class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash

    hash = 1
    self.each do |ele|
      hash = (hash ^ ele).to_s(2).to_i
    end
    hash
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
