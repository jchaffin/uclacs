local UclacsGraph = {}

function UclacsGraph:run()
   local g = self.digraph -- The graph model
   local alpha = (2 * math.pi) / #g.vertices
   local radius = g.options.radius
   for i,vertex in ipairs(g.vertices) do
      vertex.pos.x = radius * math.cos(i * alpha)
      vertex.pos.y = radius * math.sin(i * alpha)
   end
end


-- "Publish" the algorithm 
local graph_drawing_framework = require "pgf.gd.interface.InterfaceToAlgorithms"
graph_drawing_framework.declare {
   key = "uclacs graph layout",
   algorithm = UclacsGraph,
   preconditions = { connected = true }
}
  


