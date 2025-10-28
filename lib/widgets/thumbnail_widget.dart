import 'package:flutter/material.dart';

/// Placeholder for the thumbnail (to be replaced by Image.network in a real app).
class ThumbnailWidget extends StatelessWidget {
  final String videoID;
  final double height;
  final double width;
  final bool showIcon;

  const ThumbnailWidget({
    super.key,
    required this.videoID,
    this.height = 70,
    this.width = double.infinity,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    // In a real app, use: 
    // Image.network('https://img.youtube.com/vi/$videoID/mqdefault.jpg', fit: BoxFit.cover)
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (showIcon) Icon(Icons.play_arrow_outlined, color: Theme.of(context).colorScheme.primary),
          
          Positioned(
            bottom: 4,
            child: Text('Thumbnail', style: TextStyle(fontSize: 8, color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}