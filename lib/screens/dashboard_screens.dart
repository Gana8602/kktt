import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150', // Replace with the actual image URL or asset path
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Hello, Livia Vaccaro',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Progress Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your today\'s task almost done!',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blueAccent,
                          ),
                          child: const Text('View Task'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: CircularProgressIndicator(
                          value: 0.85,
                          backgroundColor: Colors.white38,
                          color: Colors.white,
                          strokeWidth: 6,
                        ),
                      ),
                      const Text(
                        '85%',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // In Progress Section
            const Text(
              'In Progress',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildTaskCard('Office Project', 'Grocery shopping app design',
                    Colors.blue),
                const SizedBox(width: 10),
                _buildTaskCard('Personal Project',
                    'Uber Eats redesign challenge', Colors.redAccent),
              ],
            ),
            const SizedBox(height: 20),

            // Task Groups
            const Text(
              'Task Groups',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                _buildTaskGroupChip('Office Project', '20 Tasks',
                    Colors.orangeAccent, 0.70, '70%'),
                _buildTaskGroupChip(
                    'Personal Project', '30 tasks', Colors.green, 0.50, "50%"),
                _buildTaskGroupChip(
                    'Daily Study', '30T asks', Colors.purple, 0.68, '68%'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for Task Card
  Widget _buildTaskCard(String title, String task, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              task,
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.5,
              color: color,
              backgroundColor: color.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for Task Group Chip
  Widget _buildTaskGroupChip(
      String label, String subtitle, Color color, double val, String percent) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        leading: Icon(Icons.cases_outlined),
        title: Text(label, style: TextStyle(color: color)),
        subtitle: Text(subtitle),
        trailing: Stack(alignment: Alignment.center, children: [
          CircularProgressIndicator(
            value: val,
            backgroundColor: Colors.white38,
            color: Colors.blue,
            strokeWidth: 4,
          ),
          Text(
            percent,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ]),
      ),

      // label: Text(label, style: TextStyle(color: Colors.white)),
      // backgroundColor: color,
      // padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    );
  }
}
