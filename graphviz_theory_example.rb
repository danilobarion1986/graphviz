require 'graphviz'
require 'graphviz/theory'

g = GraphViz.new(:G, type: :digraph)

# Create two nodes
hello = g.add_nodes('Hello')
world = g.add_nodes('World')
final = g.add_nodes('Final!')
final2 = g.add_nodes('Final2!')
final3 = g.add_nodes('Final3!')
final4 = g.add_nodes('Final4!')

# Create an edge between the two nodes
g.add_edges(hello, world)
g.add_edges(hello, final)
g.add_edges(hello, final2)
g.add_edges(hello, final3)
g.add_edges(hello, final4)
g.add_edges(final, final4)
g.add_edges(final2, world)

t = GraphViz::Theory.new( g )

puts "Adjancy matrix : "
puts t.adjancy_matrix

puts "Symmetric ? #{t.symmetric?}"

puts "Incidence matrix :"
puts t.incidence_matrix

g.each_node do |name, node|
  puts "Degree of node `#{name}' = #{t.degree(node)}"
end

puts "Laplacian matrix :"
puts t.laplacian_matrix

puts "Dijkstra between hello and final"
r = t.moore_dijkstra(g.hello, g.final)
if r.nil?
  puts "No way !"
else
  print "\tPath : "; p r[:path]
  puts "\tDistance : #{r[:distance]}"
end

print "Ranges : "
rr = t.range
p rr
puts "Your graph contains circuits" if rr.include?(nil)

#puts "Critical path : "
#rrr = t.critical_path
#print "\tPath "; p rrr[:path]
#puts "\tDistance : #{rrr[:distance]}"
