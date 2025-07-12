import 'package:flutter/material.dart';

class AlgorithmsPage extends StatelessWidget {
  const AlgorithmsPage({super.key});

  final List<Map<String, String>> qaList = const [
    {
      'question': 'What is an algorithm?',
      'answer':
          'An algorithm is a finite sequence of well-defined instructions, typically used to solve a class of specific problems or perform a computation.',
    },
    {
      'question': 'What is time complexity?',
      'answer':
          'Time complexity is a computational complexity that describes the amount of time it takes to run an algorithm based on the input size.',
    },
    {
      'question': 'What is Big O notation?',
      'answer':
          'Big O notation is used to classify algorithms according to how their run time or space requirements grow as the input size grows.',
    },
    {
      'question': 'What is the difference between linear and binary search?',
      'answer':
          'Linear search checks each element one by one, while binary search divides the array in half each time. Binary search is faster but requires a sorted array.',
    },
    {
      'question': 'What is recursion?',
      'answer':
          'Recursion is a technique where a function calls itself to solve smaller instances of a problem.',
    },
    {
      'question': 'What is a sorting algorithm?',
      'answer':
          'A sorting algorithm arranges elements of a list in a certain order, such as ascending or descending.',
    },
    {
      'question': 'What is bubble sort?',
      'answer':
          'Bubble sort is a simple comparison-based sorting algorithm where each pair of adjacent elements is compared and swapped if they are in the wrong order.',
    },
    {
      'question': 'What is merge sort?',
      'answer':
          'Merge sort is a divide-and-conquer algorithm that divides the array into halves, sorts them recursively, and merges them back.',
    },
    {
      'question': 'What is quick sort?',
      'answer':
          'Quick sort is a divide-and-conquer algorithm that picks a pivot, partitions the array, and recursively sorts the sub-arrays.',
    },
    {
      'question': 'What is selection sort?',
      'answer':
          'Selection sort selects the smallest element from the unsorted portion and swaps it with the first unsorted element.',
    },
    {
      'question': 'What is insertion sort?',
      'answer':
          'Insertion sort builds the sorted list one element at a time by inserting elements into their correct position.',
    },
    {
      'question': 'What is dynamic programming?',
      'answer':
          'Dynamic programming is an optimization technique that solves problems by breaking them into overlapping subproblems and storing their solutions.',
    },
    {
      'question': 'What is greedy algorithm?',
      'answer':
          'A greedy algorithm makes the locally optimal choice at each step in the hope of finding the global optimum.',
    },
    {
      'question': 'What is backtracking?',
      'answer':
          'Backtracking is an algorithmic technique for solving problems incrementally, trying partial solutions and abandoning them if they are not valid.',
    },
    {
      'question': 'What is memoization?',
      'answer':
          'Memoization is a technique to store previously computed results to avoid redundant computations in recursive algorithms.',
    },
    {
      'question': 'What is a graph algorithm?',
      'answer':
          'Graph algorithms are used to process graphs, including tasks like traversal, shortest path finding, and cycle detection.',
    },
    {
      'question': 'What is Dijkstra’s algorithm?',
      'answer':
          'Dijkstra’s algorithm is used to find the shortest path from a single source node to all other nodes in a weighted graph.',
    },
    {
      'question': 'What is BFS (Breadth First Search)?',
      'answer':
          'BFS is a graph traversal algorithm that explores all neighbor nodes at the current depth before moving to the next level.',
    },
    {
      'question': 'What is DFS (Depth First Search)?',
      'answer':
          'DFS is a graph traversal algorithm that explores as far as possible along each branch before backtracking.',
    },
    {
      'question': 'What is the difference between BFS and DFS?',
      'answer':
          'BFS uses a queue and explores level by level, while DFS uses a stack (or recursion) and explores depth first.',
    },
    {
      'question': 'What is a heap?',
      'answer':
          'A heap is a special tree-based data structure that satisfies the heap property – the parent is always greater or smaller than its children.',
    },
    {
      'question': 'What is a priority queue?',
      'answer':
          'A priority queue is a data structure where each element has a priority, and elements are served based on priority.',
    },
    {
      'question': 'What is topological sorting?',
      'answer':
          'Topological sorting is the linear ordering of vertices of a directed acyclic graph such that for every directed edge u → v, u comes before v.',
    },
    {
      'question': 'What is Floyd-Warshall algorithm?',
      'answer':
          'The Floyd-Warshall algorithm is used for finding shortest paths in a weighted graph with positive or negative edge weights.',
    },
    {
      'question': 'What is Bellman-Ford algorithm?',
      'answer':
          'The Bellman-Ford algorithm computes shortest paths from a single source vertex to all other vertices in a weighted graph.',
    },
    {
      'question': 'What is Kruskal’s algorithm?',
      'answer':
          'Kruskal’s algorithm finds a minimum spanning tree by sorting edges and adding them one by one while avoiding cycles.',
    },
    {
      'question': 'What is Prim’s algorithm?',
      'answer':
          'Prim’s algorithm finds a minimum spanning tree by growing it from a starting node and adding the smallest edge each time.',
    },
    {
      'question': 'What is the traveling salesman problem?',
      'answer':
          'The TSP is a classic optimization problem that aims to find the shortest possible route that visits each city once and returns to the origin.',
    },
    {
      'question': 'What is the knapsack problem?',
      'answer':
          'The knapsack problem is an optimization problem where you aim to maximize value in a bag with a weight limit.',
    },
    {
      'question': 'What is divide and conquer?',
      'answer':
          'Divide and conquer is an algorithm design paradigm that divides a problem into smaller sub-problems, solves them recursively, and combines their results.',
    },
    {
      'question': 'What is complexity analysis?',
      'answer':
          'Complexity analysis is used to evaluate the efficiency of an algorithm in terms of time and space requirements.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Algorithm Questions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: qaList.length,
        itemBuilder: (context, index) {
          final qa = qaList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 6.0,
            ),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ExpansionTile(
                title: Text(
                  qa['question'] ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      qa['answer'] ?? '',
                      style: const TextStyle(fontSize: 15),
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
