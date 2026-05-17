import 'package:flutter/material.dart';
import 'dart:io';
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



   @override
  Widget build(BuildContext context) {
    final asset = ModalRoute.of(context)?.settings.arguments as AssetModel?;

    if (asset == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: Text("Asset not found", style: TextStyle(color: Colors.white))),
      );
    }
  }

    return Scaffold(
      backgroundColor: Colors.black,
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
                      backgroundColor: Colors.black,
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
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );

}