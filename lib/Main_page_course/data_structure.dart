import 'package:flutter/material.dart';

class data_structure extends StatelessWidget {
  const data_structure({super.key});

  final List<Map<String, String>> qaList = const [
    {
      'question': 'What is a Data Structure?',
      'answer':
          'A data structure is a way of organizing, managing, and storing data to enable efficient access and modification.',
    },
    {
      'question': 'What are the types of Data Structures?',
      'answer':
          'Types include Linear (Arrays, Linked Lists, Stacks, Queues) and Non-Linear (Trees, Graphs).',
    },
    {
      'question': 'What is an Array?',
      'answer':
          'An array is a collection of elements stored at contiguous memory locations.',
    },
    {
      'question': 'What is a Linked List?',
      'answer':
          'A linked list is a linear data structure where each element points to the next, forming a chain.',
    },
    {
      'question': 'What is a Stack?',
      'answer':
          'A stack is a linear data structure that follows the LIFO (Last In First Out) principle.',
    },
    {
      'question': 'What is a Queue?',
      'answer':
          'A queue is a linear data structure that follows the FIFO (First In First Out) principle.',
    },
    {
      'question': 'What is a Tree?',
      'answer':
          'A tree is a hierarchical data structure consisting of nodes, with one root and zero or more children.',
    },
    {
      'question': 'What is a Binary Tree?',
      'answer':
          'A binary tree is a tree where each node has at most two children.',
    },
    {
      'question': 'What is a Binary Search Tree (BST)?',
      'answer':
          'A BST is a binary tree where each left child has a smaller value and each right child has a greater value.',
    },
    {
      'question': 'What is a Heap?',
      'answer':
          'A heap is a special tree-based structure that satisfies the heap property: max-heap or min-heap.',
    },
    {
      'question': 'What is a Graph?',
      'answer':
          'A graph is a collection of nodes (vertices) connected by edges.',
    },
    {
      'question': 'What is the difference between a Tree and a Graph?',
      'answer':
          'A tree is a special case of a graph with no cycles and one connected component.',
    },
    {
      'question': 'What is a Hash Table?',
      'answer':
          'A hash table stores key-value pairs and allows fast data retrieval using a hash function.',
    },
    {
      'question': 'What is the difference between Stack and Queue?',
      'answer': 'Stack uses LIFO order, whereas Queue uses FIFO order.',
    },
    {
      'question': 'What are dynamic arrays?',
      'answer':
          'Dynamic arrays can resize automatically when elements are added or removed.',
    },
    {
      'question': 'What is a Doubly Linked List?',
      'answer':
          'A linked list where each node contains pointers to both the next and previous nodes.',
    },
    {
      'question': 'What is a Circular Linked List?',
      'answer':
          'A linked list where the last node points back to the head, forming a circle.',
    },
    {
      'question': 'What is Recursion?',
      'answer':
          'Recursion is a method where a function calls itself to solve sub-problems.',
    },
    {
      'question': 'What is a Trie?',
      'answer':
          'A trie is a tree-like structure used to store associative data, usually strings.',
    },
    {
      'question': 'What is a Segment Tree?',
      'answer':
          'A segment tree is used for storing intervals or segments and allows querying in logarithmic time.',
    },
    {
      'question': 'What is a Binary Indexed Tree (Fenwick Tree)?',
      'answer':
          'A data structure that efficiently updates elements and calculates prefix sums in logarithmic time.',
    },
    {
      'question': 'What is Depth First Search (DFS)?',
      'answer':
          'DFS is a graph traversal technique that explores as far as possible along each branch before backtracking.',
    },
    {
      'question': 'What is Breadth First Search (BFS)?',
      'answer':
          'BFS is a graph traversal technique that explores all neighbors at the current depth before going deeper.',
    },
    {
      'question': 'What is Topological Sorting?',
      'answer':
          'Topological sorting orders vertices in a directed acyclic graph such that for every directed edge u → v, u comes before v.',
    },
    {
      'question': 'What is a Priority Queue?',
      'answer':
          'A priority queue is an abstract data type where each element is associated with a priority and served based on that priority.',
    },
    {
      'question': 'What is a Deque?',
      'answer':
          'A deque (double-ended queue) is a linear structure that allows insertion and deletion from both ends.',
    },
    {
      'question': 'What is Amortized Analysis?',
      'answer':
          'It is an analysis to find the average time per operation over a sequence of operations.',
    },
    {
      'question': 'What is a Bloom Filter?',
      'answer':
          'A Bloom filter is a space-efficient probabilistic data structure used to test whether an element is a member of a set.',
    },
    {
      'question': 'What is a Union-Find data structure?',
      'answer':
          'A structure that keeps track of elements partitioned into disjoint sets and supports union and find operations.',
    },
    {
      'question': 'What is an Adjacency Matrix?',
      'answer':
          'A 2D array used to represent a graph where cell [i][j] denotes an edge between vertex i and j.',
    },
    {
      'question': 'What is an Adjacency List?',
      'answer':
          'A collection of lists used to represent a graph, where each list describes a vertex’s adjacent vertices.',
    },
    {
      'question': 'What is the time complexity of binary search?',
      'answer': 'O(log n)',
    },
    {
      'question': 'What is the time complexity of linear search?',
      'answer': 'O(n)',
    },
    {
      'question': 'What is the time complexity of inserting in a Binary Heap?',
      'answer': 'O(log n)',
    },
    {
      'question': 'What is a Self-Balancing Tree?',
      'answer':
          'A tree that automatically maintains its height to ensure operations like insert and delete take O(log n) time.',
    },
    {
      'question': 'What is an AVL Tree?',
      'answer':
          'An AVL tree is a self-balancing binary search tree where the difference in heights of left and right subtrees is at most 1.',
    },
    {
      'question': 'What is a Red-Black Tree?',
      'answer':
          'A balanced binary search tree with an extra bit for denoting the color of a node.',
    },
    {
      'question': 'What are Graph Cycles?',
      'answer':
          'A cycle in a graph is a path of edges and vertices where a vertex is reachable from itself.',
    },
    {
      'question': 'What is a Sparse Matrix?',
      'answer': 'A matrix in which most elements are zero.',
    },
    {
      'question': 'What is Hash Collision?',
      'answer':
          'A situation where two keys hash to the same index in a hash table.',
    },
    {
      'question': 'What is Load Factor in Hash Table?',
      'answer':
          'It is the ratio of the number of elements to the total number of buckets.',
    },
    {
      'question': 'What is Rehashing?',
      'answer':
          'Rehashing is the process of re-allocating the hash table to a larger size to reduce collisions.',
    },
    {
      'question': 'What is Graph Coloring?',
      'answer':
          'Assigning colors to graph vertices so that no two adjacent vertices share the same color.',
    },
    {
      'question': 'What is a Minimum Spanning Tree (MST)?',
      'answer': 'A spanning tree with the minimum sum of edge weights.',
    },
    {
      'question': 'What is Kruskal’s Algorithm?',
      'answer':
          'An algorithm to find MST by sorting all edges and adding them one by one while avoiding cycles.',
    },
    {
      'question': 'What is Prim’s Algorithm?',
      'answer':
          'An algorithm that grows the MST by adding the smallest edge that connects a new vertex.',
    },
    {
      'question': 'What is Dijkstra’s Algorithm?',
      'answer':
          'An algorithm for finding the shortest path from a source node to all other nodes in a weighted graph.',
    },
    {
      'question': 'What is Floyd-Warshall Algorithm?',
      'answer':
          'A dynamic programming algorithm to find the shortest paths between all pairs of vertices.',
    },
    {
      'question': 'What is the difference between BFS and DFS?',
      'answer':
          'BFS uses a queue and explores level by level, while DFS uses a stack and explores deep before backtracking.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Structure Questions')),
      body: ListView.builder(
        itemCount: qaList.length,
        itemBuilder: (context, index) {
          final qa = qaList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                title: Text(
                  qa['question'] ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      qa['answer'] ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
