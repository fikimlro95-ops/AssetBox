class AssetModel {
  final String id;
  final String name;
  final String fileSize;
  final int likeCount;
  final int downloadCount;
  final String description;
  final String imagePath;
  final String modelPath;

  AssetModel({
    required this.id,
    required this.name,
    required this.fileSize,
    required this.likeCount,
    required this.downloadCount,
    required this.description,
    required this.imagePath,
    required this.modelPath,
  });
}