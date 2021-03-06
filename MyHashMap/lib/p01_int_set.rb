class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false) 
  end

  attr_reader :store

  def insert(num)
    raise "Out of bounds" if num > (@store.length - 1) || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] 
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
    @num_buckets = num_buckets
  end

  def insert(num)
    idx = num % @num_buckets
    @store[idx] << num
  end

  def remove(num)
    idx = num % @num_buckets
    @store[idx].delete(num)
  end

  def include?(num)
    idx = num % @num_buckets
    @store[idx].each do |el|
      return true if el == num
    end
    false
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
    @num_buckets = num_buckets
  end

  def insert(num)
    return if include?(num)
    if @store.length == @count
      resize!
    end
    idx = num % @num_buckets
    @store[idx] << num
    @count += 1
  end

  def remove(num)
    return if self.include?(num) == false
    idx = num % @num_buckets
    @store[idx].delete(num)
    @count -= 1
  end

  def include?(num)
    idx = num % @num_buckets
    @store[idx].each do |el|
      return true if el == num
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = @count * 2
    @num_buckets = new_size
    new_store = Array.new(new_size) {Array.new}
    @store.each do |sub|
      sub.each do |ele|
        idx = ele % @num_buckets
        new_store[idx] << ele
      end
    end
    @store = new_store
  end
end


