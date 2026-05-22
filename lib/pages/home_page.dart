import 'package:flutter/material.dart';
import '../models/asset_model.dart';
import '../widgets/floating_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final List<AssetModel> assets = [
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

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                _buildSearchBar(),
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
                    itemCount: assets.length,
                    itemBuilder: (context, index) {
                      return _buildAssetCard(context, assets[index]);
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AssetBox',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Discover Modern\nFurniture and Dev asset',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white, size: 28),
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

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(25),
        ),
        child: const TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
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

  Widget _buildAssetCard(BuildContext context, AssetModel asset) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: asset);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  color: Colors.grey[800], // Background untuk gambar placeholder
                  width: double.infinity,
                  child: Image.asset(
                    asset.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image, color: Colors.grey, size: 40);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatIcon(Icons.folder_outlined, asset.fileSize),
                      _buildStatIcon(Icons.favorite_border, '${asset.likeCount}'),
                      _buildStatIcon(Icons.download_outlined, '${asset.downloadCount}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 16),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ],
    );
  }
}
