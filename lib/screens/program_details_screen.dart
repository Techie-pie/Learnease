import 'package:flutter/material.dart';
import '../models/program.dart';
import '../widgets/youtube_player_placeholder.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final Program program;
  const ProgramDetailsScreen({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(program.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Use the YouTube player placeholder
          YouTubePlayerPlaceholder(videoId: program.videoID),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(
                child: Text(program.title,
                    style: Theme.of(context).textTheme.headlineSmall)),
            ElevatedButton.icon(
                onPressed: () => _enroll(context),
                icon: const Icon(Icons.school),
                label: const Text('Enroll'))
          ]),
          const SizedBox(height: 8),
          Text(
              'By ${program.instructor} • ${program.rating.toStringAsFixed(1)} ⭐',
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 12),
          Text(program.description,
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          Card(
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('What you will learn',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        _bullet('Build hands-on projects'),
                        _bullet('Understand architecture and patterns'),
                        _bullet('Prepare for practical interviews'),
                      ]))),
          const SizedBox(height: 16),
          Row(children: [
            OutlinedButton.icon(
                onPressed: () =>
                    Navigator.popUntil(context, ModalRoute.withName('/home')),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to home')),
            const SizedBox(width: 12),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/feedback'),
                child: const Text('Give feedback'))
          ])
        ]),
      ),
    );
  }

  void _enroll(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Enroll'),
        content: Text('Do you want to enroll in "${program.title}"?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Enrolled in ${program.title}')));
              },
              child: const Text('Confirm'))
        ],
      ),
    );
  }

  Widget _bullet(String text) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const Text('• '), Expanded(child: Text(text))]));
}
