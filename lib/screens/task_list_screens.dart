import 'package:flutter/material.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Today\'s Task'),
        centerTitle: true,
        actions: [Icon(Icons.notifications)],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Selector Row
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // scrollDirection: Axis.horizontal,
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
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildFilterButton(context, 'All', true),
                    _buildFilterButton(context, 'To-do', false),
                    _buildFilterButton(context, 'In Progress', false),
                    _buildFilterButton(context, 'Completed', false),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Task List
              Expanded(
                child: ListView(
                  children: [
                    _buildTaskItem(
                        'Market Research',
                        'Grocery shopping app design',
                        '10:10 AM',
                        'To-do',
                        Colors.blue,
                        Icons.cases_outlined),
                    _buildTaskItem(
                        'Competitive Analysis',
                        'Grocery shopping app design',
                        '10:10 AM',
                        'In Progress',
                        Colors.orange,
                        Icons.cases_outlined),
                    _buildTaskItem(
                        'Create Low-Fidelity Wireframe',
                        'UX Design Project',
                        '10:10 AM',
                        'To-do',
                        Colors.green,
                        Icons.person_2),
                    _buildTaskItem(
                        'How to pitch a Design Sprint',
                        'Product Presentation',
                        '10:10 AM',
                        'Completed',
                        Colors.purple,
                        Icons.menu_book_sharp),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation with Floating Action Button
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Colors.blueAccent,
      //   shape: CircleBorder(),
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.blue[50],
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 9,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
      //       const SizedBox(width: 40), // Space for FAB
      //       IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      //     ],
      //   ),
      // ),
    );
  }

  // Helper for Date Card
  Widget _buildDateCard(
      String month, String day, String weekday, bool isSelected) {
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
  Widget _buildFilterButton(
      BuildContext context, String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 30,
          // width: 100,
          decoration: BoxDecoration(
              color: isSelected
                  ? Colors.blueAccent
                  : const Color.fromARGB(158, 192, 215, 240),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? Colors.white
                      : const Color.fromARGB(255, 48, 189, 255),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper for Task Item
  Widget _buildTaskItem(String taskName, String projectName, String time,
      String status, Color color, icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // CircleAvatar(
          //   radius: 8,
          //   backgroundColor: color,
          // ),
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
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 14,
                      color: Color.fromARGB(255, 154, 215, 251),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 154, 215, 251)),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                icon,
                size: 14,
              ),
              Text(
                status,
                style: TextStyle(color: color, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
