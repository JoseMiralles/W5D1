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
    self.each do |node|
      if node.key == key
        return node.val
      end
    end
    nil
  end

  def include?(key)

  end

  def append(key, val)
    if @head.key == nil && @head.val == nil
      @head = Node.new(key, val)
      @head.next = nil
      @tail.prev = @head
      @tail = @head
      return 
    else
      @tail.next = Node.new(key, val)
      @tail.next.prev = @tail.prev
      @tail = @tail.next
    end
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        if node.prev != nil && node.next != nil
          node.prev.next = node.next
          node.next.prev = node.prev
          p node
        elsif node.prev == nil && node.next == nil
          @head = Node.new
          @tail = @head
        elsif node == @head
          if @head.next != nil
            @head = @head.next
          else
            @head = Node.new
          end
        elsif node == @tail
          @tail.prev = nil
        end
      end
    end
  end

  def each(&prc)
    current = @head
    while current != nil
      prc.call(current)
      current = current.next 
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
