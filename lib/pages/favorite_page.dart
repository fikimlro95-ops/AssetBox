import 'package:flutter/material.dart';
import '../widgets/floating_nav_bar.dart';
import '../models/asset_model.dart';
import '../widgets/asset_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

   State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 24.0, top: 24.0, bottom: 16.0),
                  child: Text(
                    'Favorit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: favoriteAssets.isEmpty
                      ? const Center(
                          child: Text(
                            'Belum ada aset favorit',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        )
                      : GridView.builder(
                          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120, top: 16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.80,
                          ),
                          itemCount: favoriteAssets.length,
                          itemBuilder: (context, index) {
                            return AssetCard(
                              asset: favoriteAssets[index],
                              onPop: () {
                                setState(() {});
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
        
           const Align(
              alignment: Alignment.bottomCenter,
              child: FloatingNavBar(selectedIndex: 1),
            ),
          ],
        ),
      ),
    );
  }
}
