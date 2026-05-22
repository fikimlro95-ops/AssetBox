import 'package:flutter/material.dart';
import '../widgets/floating_nav_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Text('Favorite Items', style: TextStyle(color: Colors.white)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingNavBar(currentIndex: 1),
            ),
          ],
        ),
      ),
    );
  }
}
