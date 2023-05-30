class BinarySearchTreeArray
  attr_accessor :array

  def initialize
    @array = []
  end

  def insert(value)
    if @array.empty?
      @array.push(value)
    else
      insert_into_array(value, 0)
    end
  end

  def insert_into_array(value, index)
    if index >= @array.length || @array[index].nil?
      @array[index] = value
    elsif value <= @array[index]
      insert_into_array(value, 2 * index + 1)
    else
      insert_into_array(value, 2 * index + 2)
    end
  end

  def search(value, index = 0)
    return false if index >= @array.length || @array[index].nil?
    
    if value == @array[index]
      true
    elsif value < @array[index]
      search(value, 2 * index + 1)
    else
      search(value, 2 * index + 2)
    end
  end
end