import 'package:flutter/material.dart';

class FloatingNavBar extends StatelessWidget {
  final int currentIndex;

  const FloatingNavBar({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, left: 24.0, right: 24.0),
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
              icon: Icons.home_outlined,
              label: 'Home',
              isSelected: currentIndex == 0,
              onTap: () {
                if (currentIndex != 0) Navigator.pushReplacementNamed(context, '/');
              },
            ),
            _buildNavItem(
              icon: Icons.favorite_border,
              label: 'Like',
              isSelected: currentIndex == 1,
              onTap: () {
                if (currentIndex != 1) Navigator.pushReplacementNamed(context, '/favorite');
              },
            ),
            _buildNavItem(
              icon: Icons.settings_outlined,
              label: 'Setting',
              isSelected: currentIndex == 2,
              onTap: () {
                if (currentIndex != 2) Navigator.pushReplacementNamed(context, '/setting');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: isSelected
          ? Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.black54, size: 28),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
    );
  }
}
