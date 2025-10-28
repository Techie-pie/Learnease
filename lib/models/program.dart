import 'dart:convert';

class Program {
  final String id;
  final String title;
  final String instructor;
  final String description;
  final double rating;
  final String videoID; 

  Program({
    required this.id,
    required this.title,
    required this.instructor,
    required this.description,
    required this.rating,
    required this.videoID,
  });

  /// Factory constructor to create a Program from a JSON Map.
  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'] as String,
      title: json['title'] as String,
      instructor: json['instructor'] as String,
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
      videoID: json['videoID'] as String,
    );
  }
}

/// Simulated raw JSON data.
const String mockProgramsJson = '''
[
  {
    "id": "p0",
    "title": "Flutter Basics: State Management",
    "instructor": "Alice",
    "description": "An in-depth hands-on course covering core concepts, practical tasks and mini-projects to solidify learning.",
    "rating": 4.0,
    "videoID": "Yg5M21Fv_aQ" 
  },
  {
    "id": "p1",
    "title": "Advanced Dart: Streams & Futures",
    "instructor": "Bob",
    "description": "An in-depth hands-on course covering core concepts, practical tasks and mini-projects to solidify learning.",
    "rating": 4.1,
    "videoID": "H88Qn4p_qG0"
  },
  {
    "id": "p2",
    "title": "UI/UX Design for Mobile",
    "instructor": "Clara",
    "description": "An in-depth hands-on course covering core concepts, practical tasks and mini-projects to solidify learning.",
    "rating": 4.2,
    "videoID": "EwV7qC-9s6w"
  },
  {
    "id": "p3",
    "title": "Data Structures in Dart",
    "instructor": "Derek",
    "description": "An in-depth hands-on course covering core concepts, practical tasks and mini-projects to solidify learning.",
    "rating": 4.3,
    "videoID": "BBF3b21g764"
  },
  {
    "id": "p4",
    "title": "Algorithms: Sorting and Searching",
    "instructor": "Alice",
    "description": "An in-depth hands-on course covering core concepts, practical tasks and mini-projects to solidify learning.",
    "rating": 4.4,
    "videoID": "Yg5M21Fv_aQ" 
  },
  {
    "id": "p5",
    "title": "Intro to ML with Dart",
    "instructor": "Bob",
    "description": "An in-depth hands-on course covering core concepts, practical tasks and mini-projects to solidify learning.",
    "rating": 4.0,
    "videoID": "H88Qn4p_qG0"
  }
]
''';