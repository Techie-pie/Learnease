import 'package:flutter/material.dart';
import 'models/program.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/programs_list_screen.dart';
import 'screens/program_details_screen.dart';
import 'screens/feedback_screen.dart';

void main() {
  runApp(const LearnlyDemo());
}

class LearnlyDemo extends StatelessWidget {
  const LearnlyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learnly',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
        '/programs': (_) => const ProgramsListScreen(),
        '/feedback': (_) => const FeedbackScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          // Note: The Program model now needs to be imported for this
          final program = settings.arguments as Program?;
          if (program != null) {
            return MaterialPageRoute(
                builder: (_) => ProgramDetailsScreen(program: program));
          }
        }
        return null;
      },
    );
  }
}
