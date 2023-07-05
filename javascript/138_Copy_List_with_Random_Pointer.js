/**
 * Definition for singly-linked list with a random pointer.
 * function RandomListNode(label) {
 *     this.label = label;
 *     this.next = this.random = null;
 * }
 */

/**
 * @param {RandomListNode} head
 * @return {RandomListNode}
 */
var copyRandomList = function(head) {
    if ( ! head )
        return null;

    var hash = new Map();
    var new_arr = [];
    var node = head;

    while (node)
    {
        hash.set(node, new_arr.length);
        new_arr.push(new RandomListNode(node.label));
        node = node.next;
    }

    node = head;
    var i = 0,
        len = new_arr.length;

    for (i = 0; i < len; i++)
    {
        if (new_arr[i+1])
            new_arr[i].next = new_arr[i+1];

        var random = node.random;
        var hash_random = hash.get(random);

        if (hash_random !== undefined)
        {
            new_arr[i].random = new_arr[hash_random];
        }

        node = node.next;
    }

    return new_arr[0];

};