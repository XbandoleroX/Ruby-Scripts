# Basic implementation of a graph
class Graph
  attr_accessor :adjacency_list

  def initialize
    @adjacency_list = {}
  end

  def add_vertex(vertex)
    @adjacency_list[vertex] = []
  end

  def add_edge(vertex1, vertex2)
    @adjacency_list[vertex1] << vertex2
    @adjacency_list[vertex2] << vertex1
  end

  def remove_vertex(vertex)
    @adjacency_list.delete(vertex)
    @adjacency_list.each do |_, edges|
      edges.delete(vertex)
    end
  end

  def remove_edge(vertex1, vertex2)
    @adjacency_list[vertex1].delete(vertex2)
    @adjacency_list[vertex2].delete(vertex1)
  end

  def print_graph
    @adjacency_list.each do |vertex, edges|
      puts "#{vertex}: #{edges.join(', ')}"
    end
  end

  def breadth_first_search(start_vertex)
    visited = []
    queue = [start_vertex]

    while !queue.empty?
      current_vertex = queue.shift
      visited << current_vertex

      @adjacency_list[current_vertex].each do |neighbor|
        unless visited.include?(neighbor) || queue.include?(neighbor)
          queue << neighbor
        end
      end
    end

    visited
  end
end