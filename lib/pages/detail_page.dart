import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import '../models/asset_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  bool _isDownloading = false;

//logika tombol download
Future<void> _downloadAsset(String url, String fileName) async {
    setState(() {
      _isDownloading = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Mengunduh aset...")),
    );

    try {
      final dio = Dio();
      final dir = await getApplicationDocumentsDirectory();
      // Remove spaces or invalid chars from filename
      final sanitizedFileName = fileName.replaceAll(' ', '_');
      final filePath = '${dir.path}/$sanitizedFileName.glb';

      await dio.download(url, filePath);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Aset berhasil diunduh!")),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Gagal mengunduh: $e")),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isDownloading = false;
        });
      }
    }
  }


   @override
  Widget build(BuildContext context) {
    final asset = ModalRoute.of(context)?.settings.arguments as AssetModel?;

    if (asset == null) {
       return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Text(
            "Asset not found",
            style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
        ),
      );
    }
  
    final isFavorited = favoriteAssets.any((a) => a.id == asset.id);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: [
                // 3D Viewer
                  Positioned.fill(
                    child: ModelViewer(
                     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      src: asset.modelPath,
                      alt: "A 3D model of ${asset.name}",
                      autoRotate: true,
                      cameraControls: true,
                    ),
                  ),   

                // Header 
                  Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorited ? Icons.favorite : Icons.favorite_border,
                            color: isFavorited ? Colors.red : Theme.of(context).iconTheme.color,
                          ),
                          onPressed: () {
                            setState(() {
                              if (isFavorited) {
                                favoriteAssets.removeWhere((a) => a.id == asset.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Dihapus dari Favorit"),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              } else {
                                favoriteAssets.add(asset);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Berhasil ditambahkan ke Favorit"),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

          // Product Info
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      asset.name,
                        style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatItem(context, Icons.folder_outlined, asset.fileSize),
                        _buildStatItem(context, Icons.favorite_border, '${asset.likeCount}'),
                        _buildStatItem(context, Icons.download_outlined, '${asset.downloadCount}'),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      asset.description,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Action Button Download
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _isDownloading ? null : () => _downloadAsset(asset.modelPath, asset.name),
                  icon: _isDownloading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Icon(Icons.arrow_downward, color: Colors.white),
                  label: Text(
                    _isDownloading ? "DOWNLOADING..." : "DOWNLOAD",
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                       side: BorderSide(color: isDark ? Colors.grey : Colors.grey[700]!, width: 0.5),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

    Widget _buildStatItem(BuildContext context, IconData icon, String label) {
    return Row(
      children: [
         Icon(icon, color: Theme.of(context).iconTheme.color, size: 24),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

}