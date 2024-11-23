import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_app/screens/home.dart';
import 'package:task_management_app/screens/profile.dart';
import 'package:task_management_app/screens/welcome_screens.dart';
import 'screens/add_project_screens.dart';
import 'screens/dashboard_screens.dart';
import 'screens/task_list_screens.dart';
import 'screens/welcome_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/task_list_screen.dart';
import 'screens/add_project_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management App',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const DashboardScreen(),
    const TaskListScreen(),
    AddProjectScreen(),
    const HomePage(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        color: Color(0xFF90d5ff).withOpacity(0.3),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.blue,
        items: <Widget>[
          Icon(Icons.home, size: 20),
          Icon(Icons.calendar_month, size: 20),
          Icon(
            Icons.add,
            size: 20,
          ),
          Icon(Icons.edit_document, size: 20),
          Icon(
            Icons.people_alt,
            size: 20,
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          //Handle button tap
        },
      ),
    );
  }
}
