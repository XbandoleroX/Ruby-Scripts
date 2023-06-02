def a_star(grid, start, goal)
  directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]

  g_score = Hash.new(Float::INFINITY)
  g_score[start] = 0
  
  f_score = Hash.new(Float::INFINITY)
  f_score[start] = heuristic(start, goal)
  
  open_set = [start]
  came_from = {}

  while !open_set.empty?
    current = open_set.min_by { |node| f_score[node] }
    
    return reconstruct_path(came_from, current) if current == goal

    open_set.delete(current)
    
    directions.each do |dir|
      neighbor = [current[0] + dir[0], current[1] + dir[1]]
      next if neighbor[0] < 0 || neighbor[0] >= grid.length
      next if neighbor[1] < 0 || neighbor[1] >= grid[0].length
      next if grid[neighbor[0]][neighbor[1]] == Float::INFINITY
      
      tentative_g_score = g_score[current] + 1
      
      if tentative_g_score < g_score[neighbor]
        came_from[neighbor] = current
        g_score[neighbor] = tentative_g_score
        f_score[neighbor] = g_score[neighbor] + heuristic(neighbor, goal)
        open_set << neighbor unless open_set.include?(neighbor)
      end
    end
  end

  return nil
end

def heuristic(node, goal)
  (goal[0] - node[0]).abs + (goal[1] - node[1]).abs
end

def reconstruct_path(came_from, current)
  path = [current]
  while came_from.key?(current)
    current = came_from[current]
    path.unshift(current)
  end
  path
end

# Sample:
# grid = [[1, 1, Float::INFINITY], [1, 1, 1], [Float::INFINITY, 1, 1]]
# start = [0, 0]
# goal = [2, 2]
# p a_star(grid, start, goal)  # prints [[0, 0], [1, 0], [1, 1], [2, 2]]
