import 'package:flutter/material.dart';
import '../models/program.dart';
import '../services/program_service.dart';
import '../widgets/thumbnail_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 900;
    // Access data from the service class
    final List<Program> programs = ProgramService.demoPrograms;

    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [
          Icon(Icons.school, color: Colors.orange),
          SizedBox(width: 8),
          Text(
            'Learnly',
            style: TextStyle(
              color: Colors.orange,
            ),
          )
        ]),
        actions: [
          IconButton(
              icon: const Icon(Icons.feedback_outlined),
              onPressed: () => Navigator.pushNamed(context, '/feedback')),
        ],
      ),
      drawer: wide ? null : const Drawer(child: _AppDrawerContents()),
      body: Row(
        children: [
          if (wide) const SizedBox(width: 220, child: _AppDrawerContents()),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good day 👋',
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 8),
                    Text('Recommended for you',
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) {
                            final p = programs[i];
                            return GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, '/details',
                                  arguments: p),
                              child: Container(
                                width: 260,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ThumbnailWidget(
                                              videoID: p.videoID, height: 76),
                                          const SizedBox(height: 8),
                                          Text(p.title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                          const SizedBox(height: 6),
                                          Text(
                                              '${p.instructor} • ${p.rating.toStringAsFixed(1)} ⭐',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                        ]),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 12),
                          itemCount: programs.length),
                    ),
                    const SizedBox(height: 18),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('All Programs',
                              style: Theme.of(context).textTheme.titleMedium),
                          TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/programs'),
                              child: const Text('View all')),
                        ]),
                    const SizedBox(height: 12),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: programs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 900 ? 4 : 2,
                          childAspectRatio: 1.05,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12),
                      itemBuilder: (_, i) {
                        final p = programs[i];
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/details',
                              arguments: p),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ThumbnailWidget(
                                        videoID: p.videoID, height: 70),
                                    const SizedBox(height: 8),
                                    Text(p.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                    const Spacer(),
                                    Row(children: [
                                      Text(p.instructor,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                      const Spacer(),
                                      Text('${p.rating.toStringAsFixed(1)} ⭐')
                                    ])
                                  ]),
                            ),
                          ),
                        );
                      },
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppDrawerContents extends StatelessWidget {
  const _AppDrawerContents();

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.zero, children: [
      DrawerHeader(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Learnly', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 6),
          const Text('Learn anytime')
        ]),
      ),
      ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () => Navigator.pushReplacementNamed(context, '/home')),
      ListTile(
          leading: const Icon(Icons.list),
          title: const Text('Programs'),
          onTap: () => Navigator.pushNamed(context, '/programs')),
      ListTile(
          leading: const Icon(Icons.feedback),
          title: const Text('Feedback'),
          onTap: () => Navigator.pushNamed(context, '/feedback')),
      const Divider(),
      ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () => Navigator.pushReplacementNamed(context, '/login')),
    ]);
  }
}
