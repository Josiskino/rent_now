import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 1; 

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[100],
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            _selectedIndex == 0 ? Iconsax.chart_1 : Iconsax.chart,
          ),
          label: 'Stats',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            _selectedIndex == 1 ? Iconsax.home_15 : Iconsax.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            _selectedIndex == 2 ? Iconsax.personalcard5 : Iconsax.personalcard,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFF18191D),
      unselectedItemColor: const Color.fromARGB(178, 185, 177, 177),
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}