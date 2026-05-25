import 'package:flutter/material.dart';
import '../models/asset_model.dart';
import '../widgets/floating_nav_bar.dart';
import '../widgets/asset_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dummy Data
  final List<AssetModel> dummyAssets = [
    AssetModel(
      id: '1',
      name: 'Ore Diamond',
      fileSize: '4Mb',
      likeCount: 100,
      downloadCount: 350,
      description: 'Low poly 3D diamond ore asset dengan desain sederhana namun tetap detail. Cocok digunakan untuk game survival, mining, crafting, RPG, maupun sandbox. Memiliki tampilan batu dengan kristal diamond berwarna biru yang memberikan kesan clean dan stylized.',
      imagePath: 'assets/diamond.png',
      modelPath: 'https://knarlhnshzucrbggspqh.supabase.co/storage/v1/object/public/model/Diamond.glb',
    ),
    AssetModel(
      id: '2',
      name: 'Ore Ruby',
      fileSize: '4Mb',
      likeCount: 100,
      downloadCount: 350,
      description: 'Low poly 3D ruby ore dengan nuansa fantasy dan stylized. Didesain untuk kebutuhan game bertema petualangan, mining, atau resource collection. Memiliki detail batu dengan kristal ruby merah yang menonjol dan mudah dikenali pemain.',
      imagePath: 'assets/ruby.jpeg',
      modelPath: 'https://knarlhnshzucrbggspqh.supabase.co/storage/v1/object/public/model/ruby.glb',
    ),
    AssetModel(
      id: '3',
      name: 'Ore Gold',
      fileSize: '1Mb',
      likeCount: 100,
      downloadCount: 350,
      description: 'Aset gold ore low poly 3D yang cocok digunakan pada game survival, medieval, maupun sandbox. Memiliki tampilan batu dengan elemen emas yang sederhana namun tetap menarik untuk kebutuhan environment dan resource game.',
      imagePath: 'assets/gold.jpeg',
      modelPath: 'https://knarlhnshzucrbggspqh.supabase.co/storage/v1/object/public/model/gold.glb',
    ),
    AssetModel(
      id: '4',
      name: 'Ore Iron',
      fileSize: '1Mb',
      likeCount: 100,
      downloadCount: 350,
      description: 'Low poly 3D iron ore asset dengan desain minimalis dan optimal untuk berbagai jenis game. Cocok digunakan sebagai material tambang pada game crafting, survival, atau RPG. Memiliki detail batu dan logam besi yang stylized.',
      imagePath: 'assets/iron.jpeg',
      modelPath: 'https://knarlhnshzucrbggspqh.supabase.co/storage/v1/object/public/model/iron.glb',
    ),
    AssetModel(
      id: '5',
      name: 'Glas',
      fileSize: '2Mb',
      likeCount: 100,
      downloadCount: 350,
      description: 'Aset glass low poly 3D dengan tampilan sederhana dan clean. Cocok digunakan sebagai dekorasi, building material, atau properti environment pada game stylized maupun low poly. Desain ringan dan mudah dipadukan dengan berbagai tema game.',
      imagePath: 'assets/glas.png',
      modelPath: 'https://knarlhnshzucrbggspqh.supabase.co/storage/v1/object/public/model/glass.glb',
    ),
    AssetModel(
      id: '6',
      name: 'Sword',
      fileSize: '3Mb',
      likeCount: 100,
      downloadCount: 350,
      description: 'Low poly 3D sword dengan desain stylized dan sederhana. Cocok digunakan untuk game RPG, adventure, fantasy, maupun survival. Memiliki bentuk pedang yang clean dengan detail ringan sehingga tetap optimal digunakan dalam game development.',
      imagePath: 'assets/sword.jpeg',
      modelPath: 'https://knarlhnshzucrbggspqh.supabase.co/storage/v1/object/public/model/swordd.glb',
    ),
  ];

  List<AssetModel> displayedAssets = [];

  @override
  void initState() {
    super.initState();
    displayedAssets = dummyAssets;
  }

  void _runFilter(String enteredKeyword) {
    List<AssetModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = dummyAssets;
    } else {
      results = dummyAssets
          .where((asset) =>
              asset.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      displayedAssets = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                _buildSearchBar(context),
                Expanded(
                  child: GridView.builder(
                    // Memberikan padding bawah yang cukup agar tidak tertutup nav bar
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120, top: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.80,
                    ),
                    itemCount: displayedAssets.length,
                    itemBuilder: (context, index) {
                       return AssetCard(asset: displayedAssets[index]);
                    },
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: FloatingNavBar(selectedIndex: 0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    final iconColor = Theme.of(context).iconTheme.color;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AssetBox',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Discover Modern\nFurniture and Dev asset',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
           icon: Icon(Icons.notifications_none, color: iconColor, size: 28),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tidak ada pemberitahuan baru'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final searchBgColor = isDark ? const Color(0xFF1E1E1E) : Colors.grey[200];
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: searchBgColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          onChanged: (value) => _runFilter(value),
          style: TextStyle(color: textColor),
          decoration: const InputDecoration(
            hintText: 'Cari 3D Mu',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }

}
