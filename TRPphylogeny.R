library(tidyverse)
library(ggtree)
library(rphylopic)
library(ape)

trp <- ape::read.tree("newickTRP")

dendogramTRP <- chronos(trp)
dendogramTRP <- root(dendogramTRP, outgroup = "ScYVC1", resolve.root = TRUE)
is.ultrametric(dendogramTRP)
is.rooted(dendogramTRP)
hc = as.hclust(dendogramTRP)
dendogramTRP$node.label

plot(trp,
     edge.color = "grey",               
     tip.color = "black",                
     cex = 1,                           
     lwd = 1,                             
     show.tip.label = FALSE,               
     font = 0.1,                            
     edge.width = 2,                      
     align.tip.label = TRUE,              
     type = "radial", root.edge = TRUE, no.margin = TRUE,
     x.lim = c(-1.3, 1.3),   
     y.lim = c(-1.3, 1.3))


nodelabels(
  text = trp$node.label[trp$node.label>0.5],
  frame = "none",     # No box around the text
  cex = 0.3,          # Size of the text
  adj = c(0.5, -0.5)  # Adjust position relative to nodes
)

