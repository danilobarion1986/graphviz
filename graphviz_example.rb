#https://github.com/glejeune/Ruby-Graphviz

require 'graphviz'

# Create a new graph
g = GraphViz.new(:G, type: :digraph)

# Create two nodes
em_estoque = g.add_nodes('Em estoque')
em_separacao = g.add_nodes('Em separação')
preparado_para_envio = g.add_nodes('Preparado para envio')
enviado = g.add_nodes('Enviado')
entregue = g.add_nodes('Entregue')
rejeitado = g.add_nodes('Rejeitado')
rejeitado[:color] = "indianred"
rejeitado[:style] = "filled"

entregue[:color] = "lightseagreen"
entregue[:style] = "filled"

# Create an edge between the two nodes
g.add_edges(em_estoque, em_separacao)
g.add_edges(em_separacao, preparado_para_envio)
g.add_edges(em_separacao, rejeitado)
g.add_edges(preparado_para_envio, enviado)
g.add_edges(enviado, entregue)
g.add_edges(enviado, rejeitado)

# Generate output image
g.output(png: 'hello_world.png')
