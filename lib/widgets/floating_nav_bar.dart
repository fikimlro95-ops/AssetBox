import 'package:flutter/material.dart';

class FloatingNavBar extends StatelessWidget {
  final int selectedIndex;

  const FloatingNavBar({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {

  final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, left: 24.0, right: 24.0),
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(36),
           boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
              context: context,
              icon: Icons.home_outlined,
              label: 'Home',
              isSelected: selectedIndex == 0,
              onTap: () {
                  if (selectedIndex != 0) Navigator.pushReplacementNamed(context, '/');
              },
            ),
            _buildNavItem(
              context: context,
              icon: Icons.favorite_border,
              label: 'Like',
              isSelected: selectedIndex == 1,
              onTap: () {
                 if (selectedIndex != 1) Navigator.pushReplacementNamed(context, '/favorite');
              },
            ),
            _buildNavItem(
              context: context,
              icon: Icons.settings_outlined,
              label: 'Setting',
              isSelected: selectedIndex == 2,
              onTap: () {
                if (selectedIndex != 2) Navigator.pushReplacementNamed(context, '/setting');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {

    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: onTap,
      child: isSelected
          ? Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
              color: isDark ? Colors.white : Colors.black,
                shape: BoxShape.circle,
              ),
             child: Icon(
                icon,
                color: isDark ? Colors.black : Colors.white,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Icon(
                  icon,
                  color: isDark ? Colors.white54 : Colors.black54,
                  size: 28,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                   style: TextStyle(
                    color: isDark ? Colors.white54 : Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
    );
  }
}
