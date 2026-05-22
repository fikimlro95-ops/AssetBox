import 'package:flutter/material.dart';
import '../models/asset_model.dart';

class AssetCard extends StatelessWidget {
  final AssetModel asset;
  final VoidCallback? onPop;

  const AssetCard({super.key, required this.asset, this.onPop});

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBgColor = isDark ? const Color(0xFF1E1E1E) : Colors.grey[100];
    final placeholderColor = isDark ? Colors.grey[800] : Colors.grey[300];
    final titleColor = Theme.of(context).textTheme.bodyLarge?.color;

    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(context, '/detail', arguments: asset);
        if (onPop != null) {
          onPop!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
           color: cardBgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  color: placeholderColor,
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
                    style: TextStyle(
                      color: titleColor,
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
                      _buildStatIcon(context, Icons.folder_outlined, asset.fileSize),
                      _buildStatIcon(context, Icons.favorite_border, '${asset.likeCount}'),
                      _buildStatIcon(context, Icons.download_outlined, '${asset.downloadCount}'),
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

 Widget _buildStatIcon(BuildContext context, IconData icon, String label) {

 final color = Theme.of(context).brightness == Brightness.dark ? Colors.white70 : Colors.black87;
    return Column(
      children: [
       Icon(icon, color: color, size: 16),
        const SizedBox(height: 4),
        Text(
          label,
         style: TextStyle(color: color, fontSize: 10),
        ),
      ],
    );
  }
}

