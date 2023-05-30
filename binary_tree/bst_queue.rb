class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

def breadth_first_search(root)
  return if root.nil?

  queue = [root]

  while !queue.empty?
    node = queue.shift
    puts node.value

    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
  end
end

# Create a binary tree
root = TreeNode.new(5)
root.left = TreeNode.new(2)
root.right = TreeNode.new(8)
root.left.left = TreeNode.new(1)
root.left.right = TreeNode.new(3)

# Perform breadth-first search
breadth_first_search(root)