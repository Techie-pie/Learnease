import 'package:flutter/material.dart';
import '../models/program.dart';
import '../services/program_service.dart';
import '../widgets/thumbnail_widget.dart';

class ProgramsListScreen extends StatelessWidget {
  const ProgramsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access data from the service class
    final List<Program> programs = ProgramService.demoPrograms;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Programs'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: programs.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, i) {
          final p = programs[i];
          return ListTile(
            leading: SizedBox(
                width: 64, // fixed width for a nice thumbnail look
                child: ThumbnailWidget(
                    videoID: p.videoID,
                    height: 48,
                    width: 64,
                    showIcon: false)),
            title: Text(p.title),
            subtitle:
                Text('${p.instructor} • ${p.rating.toStringAsFixed(1)} ⭐'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(context, '/details', arguments: p),
          );
        },
      ),
    );
  }
}
