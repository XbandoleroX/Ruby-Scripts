def dijkstra(graph, src, dest)
  q, dist = [src], {src => 0}
  while (v = q.min_by { |v| dist[v] }) != dest
    q -= [v]
    graph[v].each do |n, w|
      alt = dist[v] + w.to_i
      if !dist.key?(n) || alt < dist[n]
        dist[n], graph[n][src] = alt, v
        q << n
      end
    end
  end

  path, v = [], dest
  while v
    path.unshift(v)
    v = graph[v][src]
  end

  [path, dist[dest]]
end

# Sample
# graph = {'a' => {'b' => 1, 'c' => 4}, 'b' => {'c' => 2}, 'c' => {}}
# p dijkstra(graph, 'a', 'c')  # prints [["a", "b", "c"], 3]