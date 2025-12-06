import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/landing_page.dart';
import 'pages/recommended_page.dart';
import 'pages/adaptive_page.dart';

void main() {
  runApp(const LearnzyApp());
}

class LearnzyApp extends StatelessWidget {
  const LearnzyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learnzy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4ECDC4),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    LandingPage(),
    RecommendedPage(),
    AdaptivePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: Container(
        constraints: const BoxConstraints(maxWidth: 480),
        margin: EdgeInsets.zero,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: const Color(0xFF4ECDC4),
          unselectedItemColor: const Color(0xFF6B7280),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome_outlined),
              activeIcon: Icon(Icons.auto_awesome),
              label: 'Recommended',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.psychology_outlined),
              activeIcon: Icon(Icons.psychology),
              label: 'Adaptive',
            ),
          ],
        ),
      ),
    );
  }
}
