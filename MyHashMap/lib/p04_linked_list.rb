class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return @head
  end

  def last
    return @tail
  end

  def empty?
    @head.val == nil && @tail.val == nil
  end

  def get(key)

  end

  def include?(key)

  end

  def append(key, val)
    if @head.key == nil && @head.val == nil
      @head = Node.new(key, val)
      @head.next = @head
      @tail.prev = @head
      @tail = @head
      return 
    else
      @tail.next = Node.new(key, val)
      @tail = @tail.next
    end
  end

  def update(key, val)

  end

  def remove(key)

  end

  def each

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
