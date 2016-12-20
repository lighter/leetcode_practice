'use strict';
function UndirectedGraphNode(label)
{
  this.label = label;
  this.neighbors = [];
}

let cloneGraph = function(graph)
{
    let nodes = create_nodes(graph);

    console.log('nodes ', nodes);

    let clone_map = new Map();

    let dfs = function (node)
    {
        if ( ! clone_map.has(node.label) )
        {
            clone_map.set(node.label, new UndirectedGraphNode(node.label));
        }

        // neighbors
        node.neighbors.forEach(function(neighbor) {
            if ( ! clone_map.has(neighbor.label) )
            {
                dfs(neighbor);
            }

            clone_map.get(neighbor.label).neighbors.push(neighbor.label);
        });
    };

    dfs(nodes);

    console.log('clone_map ', clone_map);
    // return clone_map.get(graph.label);
};

let create_nodes = function(struct_str) {

    let node_map = new Map();

    struct_str = struct_str.replace('{', '');
    struct_str = struct_str.replace('}', '');

    var struct_str_arr;

    console.log(struct_str.indexOf('#'));
    if (struct_str.indexOf('#') != -1)
    {
        var temp = struct_str.split('#');
        struct_str_arr = [];
        temp.forEach(function(value, index){
            struct_str_arr.push(value.split(','));
        });
    }
    else
    {
        struct_str_arr = [struct_str.split(',')];
    }

    struct_str_arr.forEach(function(values, index) {
        var first = values.shift();

        if ( ! node_map.has(first))
        {
            node_map.set(first, new UndirectedGraphNode(first));
        }

        values.forEach(function(value, v_index) {

            if ( ! node_map.has(value))
            {
                node_map.set(value, new UndirectedGraphNode(value));
            }

            node_map.get(first).neighbors.push(node_map.get(value));
        });
    });

    return node_map;
};

//let test = '{0,1,2}';
//start(test);

let test2 = '{0,1,2#1,2}';
cloneGraph(test2);

/*
let node0 = new UndirectedGraphNode(0);
let node1 = new UndirectedGraphNode(1);
let node2 = new UndirectedGraphNode(2);

node0.neighbors.push(node1, node2);
node1.neighbors.push(node0, node2);
node2.neighbors.push(node0, node1, node2, node2);
console.log(node0, node1, node2);

console.log(cloneGraph(node0));
*/
