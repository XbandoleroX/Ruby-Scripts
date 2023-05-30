Node = Struct.new(:value, :left_child, :right_child)

# Basic BSF implementation
class BinarySearchTree
  attr_accessor :root

  def initialize(root_value)
    @root = Node.new(root_value)
  end

  def insert(value, node = @root)
    if value <= node.value
      node.left_child.nil? ? node.left_child = Node.new(value) : insert(value, node.left_child)
    else
      node.right_child.nil? ? node.right_child = Node.new(value) : insert(value, node.right_child)
    end
  end

  def search(value, node = @root)
    return false if node.nil?
    
    if value == node.value
      true
    elsif value < node.value
      search(value, node.left_child)
    else
      search(value, node.right_child)
    end
  end
end