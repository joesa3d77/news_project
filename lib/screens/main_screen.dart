import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'bookmark_screen.dart';
import 'weather_screen.dart';

/// الشاشة دي هي "الحاوية" اللي بتتحكم في الـ Bottom Navigation Bar
/// وبتبدّل بين 4 تابات: Home - Search - Bookmark - Weather.
///
/// بنستخدم IndexedStack عشان كل شاشة تفضل محتفظة بحالتها
/// (يعني لو بتعمل Scroll في شاشة ورجعتلها تانى، هتلاقيها زي ما سيبتها).
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    BookmarkScreen(),
    WeatherScreen(),
  ];

  final List<IconData> _icons = const [
    Icons.home_rounded,
    Icons.public,
    Icons.bookmark,
    Icons.cloud_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// بار سفلي بشكل بسيط (Container + Row) بدل BottomNavigationBar
  /// الجاهز، عشان نقدر نتحكم في الشكل زي التصميم (بار أسود مدور).
  Widget _buildBottomBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_icons.length, (index) {
          final bool isSelected = index == _currentIndex;
          return GestureDetector(
            onTap: () => setState(() => _currentIndex = index),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(_icons[index], color: Colors.white, size: 22),
            ),
          );
        }),
      ),
    );
  }
}
