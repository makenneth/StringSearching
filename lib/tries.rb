class Node
  attr_reader :nexts
  attr_accessor :value
  def initialize
    @value = nil
    @nexts = {}
  end
end

class Tries
  attr_reader :root

  def initialize
    @root = Node.new
  end


  def put(str, value, node = root, cur_pos = 0)
    node = Node.new unless node

    if cur_pos == str.length
      node.value = value
      return node
    end
    cur_char = str[cur_pos]
    node.nexts[cur_char] = put(str, value, node.nexts[cur_char], cur_pos + 1)

    node
  end

  def get(str, node = root, cur_pos = 0)
    return -1 unless node

    return node.value if cur_pos == str.length

    get(str, node.nexts[str[cur_pos]], cur_pos + 1)
  end 

  def contains?(str)
    !!get(str)
  end
end