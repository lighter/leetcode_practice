'use strict';
function UndirectedGraphNode(label)
{
  this.label = label;
  this.neighbors = [];
}

let cloneGraph = function(graph)
{
    if ( ! graph )
    {
        return null;
    }

    let clone_map = new Map();

    let dfs = function (node)
    {
        if ( ! clone_map.has(node.label))
        {
            clone_map.set(node.label, new UndirectedGraphNode(node.label));
        }

        // neighbors
        node.neighbors.forEach(function(neighbor) {
            if ( ! clone_map.has(neighbor.label) )
            {
                dfs(neighbor);
            }

            clone_map.get(node.label).neighbors.push(neighbor.label);
        });
    };

    dfs(graph);

    return clone_map.get(graph.label);
};


let node0 = new UndirectedGraphNode(0);
let node1 = new UndirectedGraphNode(1);
let node2 = new UndirectedGraphNode(2);

node0.neighbors.push(node1, node2);
node1.neighbors.push(node0, node2);
node2.neighbors.push(node0, node1, node2, node2);

console.log(cloneGraph(node0));
