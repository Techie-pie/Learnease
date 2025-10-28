import 'dart:convert';
import '../models/program.dart';

class ProgramService {
  /// Global list to hold the loaded data
  static List<Program> demoPrograms = [];

  /// Simulates fetching and parsing a list of programs from a JSON API.
  Future<List<Program>> fetchPrograms() async {
    // 1. Simulate Network Delay
    await Future.delayed(const Duration(milliseconds: 500));

    // 2. Decode the raw JSON string into a Dart list of Maps.
    final List<dynamic> jsonList = jsonDecode(mockProgramsJson);

    // 3. Map the list of JSON objects to a list of Program objects.
    final List<Program> programs = jsonList
        .map((json) => Program.fromJson(json as Map<String, dynamic>))
        .toList();

    // Update the static variable for global access
    demoPrograms = programs;

    return programs;
  }
}
