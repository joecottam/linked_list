class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  # adds a new node to the end of the list
  def append(node_value)
    new_node = Node.new(node_value)
    if @tail == nil
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    if @head == nil
      @head = @tail
    end
  end

  # adds a new node to the start of the list
  def prepend(node_value)
    @head = Node.new(node_value, @head)
    if @tail == nil
      @tail = @head
    end
  end

  # returns the total number of nodes in the list
  def size
    node_count = 0
    if @head != nil
      node = @head
      node_count += 1
      until node.next_node == nil
        node = node.next_node 
        node_count += 1
      end
    end
    node_count
  end

  #returns the first node in the list
  def head
    @head
  end

  # returns the last node in the list
  def tail
    @tail
  end

  # returns the node at the given index
  def at(index)
    node_count = 0
    if @head != nil
      node = @head
      until node_count == index
        break if node == nil
        node = node.next_node 
        node_count += 1
      end
      node
    else
      nil
    end
  end

  # removes the last element from the list
  def pop
    number_of_nodes = self.size
    node = @head
    if number_of_nodes > 1
      node_count = 1
      until node_count == (number_of_nodes - 1)
        break if node == nil
        node = node.next_node
        node_count += 1
      end
      node.next_node = nil      
    else
      @head = nil
      @tail = nil
    end
  end

  # returns true if the passed in value is in the list, otherwise returns false
  def contains?(data)
    node = @head
    self.size.times do
      return true if node.value == data
      node = node.next_node
    end
    false
  end

  # returns the index of the node containing data, or nil if not found
  def find(data)
    node = @head
    node_count = 0
    self.size.times do
      return node_count if node.value == data
      node = node.next_node
      node_count += 1
    end
    nil
  end

  # returns a string representation of the Linked list in this format: "( data ) -> ( data ) -> ( data ) -> nil"
  def to_s
    string = ""
    if @head != nil
      node = @head
      string << "( #{node.value} ) -> "
      until node.next_node == nil
        node = node.next_node
        string << "( #{node.value} ) -> "
      end
    end
    string << "nil"
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
  def value
    @value
  end

  def next_node
    @next_node
  end
end



