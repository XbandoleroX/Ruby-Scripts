class HashBinarySearchTree
  attr_accessor :root

  def initialize(root_value = nil)
    @root = root_value.nil? ? nil : { value: root_value, left: nil, right: nil }
  end

  def insert(value, node = @root)
    if node.nil?
      @root = { value: value, left: nil, right: nil }
    else
      if value <= node[:value]
        node[:left].nil? ? node[:left] = { value: value, left: nil, right: nil } : insert(value, node[:left])
      else
        node[:right].nil? ? node[:right] = { value: value, left: nil, right: nil } : insert(value, node[:right])
      end
    end
  end

  def search(value, node = @root)
    return false if node.nil?
    
    if value == node[:value]
      true
    elsif value < node[:value]
      search(value, node[:left])
    else
      search(value, node[:right])
    end
  end
end