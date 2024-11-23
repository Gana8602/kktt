import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            const Text(
              "Task Management & To-Do List",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.blue,
              child: ElevatedButton(
                onPressed: () {
                  // Go to next page
                },
                child: const Text("Let's Start"),
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}
