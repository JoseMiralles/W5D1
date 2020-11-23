class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(key)
    return if include?(key)
    if @store.length == @count
      resize!
    end
    idx = key.hash % @num_buckets
    @store[idx] << key
    @count += 1
  end

  def include?(key)
    idx = key.hash % @num_buckets
    @store[idx].each do |el|
      return true if el == key
    end
    false
  end

  def remove(key)
    return if self.include?(key) == false
    idx = key.hash % @num_buckets
    @store[idx].delete(key)
    @count -= 1
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
        idx = ele.hash % @num_buckets
        new_store[idx] << ele
      end
    end
    @store = new_store
  end
end
