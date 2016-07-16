require 'byebug'
class Node
  attr_reader :char
  attr_accessor :left, :right, :middle, :value
  def initialize(char = nil)
    @value, @left, @right, @middle = 
      nil, nil, nil, nil
    @char = char
  end

  def inspect
    char
  end
end
class TernarySearchTries
  attr_reader :root
  def initialize
    @root = Node.new("m")
  end

  def put(str, value, node = root, cur_pos = 0)
    cur_char = str[cur_pos]
    node = Node.new(cur_char) unless node

    if cur_char > node.char
      node.right = put(str, value, node.right, cur_pos)
    elsif cur_char < node.char
      node.left = put(str, value, node.left, cur_pos)
    else
      if str.length - 1 > cur_pos
        node.middle = put(str, value, node.middle, cur_pos + 1)
      else
        node.value = value
      end
    end

    node
  end

  def get(str, node = root, cur_pos = 0)
    cur_char = str[cur_pos]

    return nil unless node

    if cur_char > node.char
      get(str, node.right, cur_pos)
    elsif cur_char < node.char
      get(str, node.left, cur_pos)
    else
      if str.length - 1 > cur_pos
        get(str, node.middle, cur_pos + 1)
      else
        node.value
      end
    end
  end
end