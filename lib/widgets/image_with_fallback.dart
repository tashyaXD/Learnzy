import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageWithFallback extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  const ImageWithFallback({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        color: const Color(0xFFF3F4F6),
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF10B981)),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: const Color(0xFFF3F4F6),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.broken_image_outlined,
                size: 48,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 8),
              Text(
                'Image not available',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
