import 'package:flutter/material.dart';

/// Placeholder for the YouTube player (as packages are not supported in DartPad).
class YouTubePlayerPlaceholder extends StatelessWidget {
  final String videoId;

  const YouTubePlayerPlaceholder({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    // Replace this with the actual YoutubePlayer widget in a real project
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.ondemand_video,
              size: 48, color: Theme.of(context).colorScheme.onSurfaceVariant),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                'Video ID: $videoId (Player Placeholder)',
                style: const TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
