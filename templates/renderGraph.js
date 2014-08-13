function renderGraph( nodes ){
 
  var xMultiplier = 30;

  var yMultiplier = 30;

  var vis = d3.select("#graph")
              .append("svg");

  d3.select("svg").attr("overflow","auto")

  vis.attr("width", "100%")
      .attr("height", "100%");
  
  var getX = function( node ){

    return node.lane * xMultiplier

  }
      
  var getY = function( node ){

    return node.line_number * yMultiplier
  
  }
  

   var node = vis.selectAll("circle.node")
            .data(nodes)
            .enter().append("g")
            .attr("class", "node")

         node.append( "svg:circle" )
            .attr("cx", function(d) { return  getX(d); })
            .attr("cy", function(d) { return  getY(d); })
            .attr("r", "7px")
            .attr("fill", "blue");

         node.append( "svg:text" )
            .text( function(d) { return d.desc; } )
            .attr("x", function(d) { return getX(d) + 10; })
            .attr("y", function(d) { return getY(d) + 5; })

         vis.selectAll("circle.nodes")
            .data(nodes)
            .enter()
            .append("svg:circle")
            .attr("cx", function(d) { return getX(d); })
            .attr("cy", function(d) { return getY(d); })



    }

