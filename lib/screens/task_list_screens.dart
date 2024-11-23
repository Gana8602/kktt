import 'package:flutter/material.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Selector Row
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildDateCard('May', '23', 'Fri', false),
                  _buildDateCard('May', '24', 'Sat', false),
                  _buildDateCard('May', '25', 'Sun', true), // Current Date
                  _buildDateCard('May', '26', 'Mon', false),
                  _buildDateCard('May', '27', 'Tue', false),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Task Filters
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterButton(context, 'All', true),
                _buildFilterButton(context, 'To-do', false),
                _buildFilterButton(context, 'In Progress', false),
                _buildFilterButton(context, 'Completed', false),
              ],
            ),
            const SizedBox(height: 20),

            // Task List
            Expanded(
              child: ListView(
                children: [
                  _buildTaskItem('Market Research', 'Grocery shopping app design', 'To-do', Colors.blue),
                  _buildTaskItem('Competitive Analysis', 'Grocery shopping app design', 'In Progress', Colors.orange),
                  _buildTaskItem('Create Low-Fidelity Wireframe', 'UX Design Project', 'To-do', Colors.green),
                  _buildTaskItem('How to pitch a Design Sprint', 'Product Presentation', 'Completed', Colors.purple),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation with Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            const SizedBox(width: 40), // Space for FAB
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }

  // Helper for Date Card
  Widget _buildDateCard(String month, String day, String weekday, bool isSelected) {
    return Container(
      width: 60,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueAccent : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            month,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontSize: 12,
            ),
          ),
          Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            weekday,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Helper for Filter Button
  Widget _buildFilterButton(BuildContext context, String label, bool isSelected) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.blueAccent : Colors.grey,
        ),
      ),
    );
  }

  // Helper for Task Item
  Widget _buildTaskItem(String taskName, String projectName, String status, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: color,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  projectName,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            status,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
