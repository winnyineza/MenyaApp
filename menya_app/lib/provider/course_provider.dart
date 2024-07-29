import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Course {
  final int id;
  final String title;

  Course({required this.id, required this.title});
}

class Lesson {
  final int id;
  final String title;
  final String content;
  final String? additionalContent;
  final String? codeSnippet;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
    this.additionalContent,
    this.codeSnippet,
  });
}

class CourseProvider with ChangeNotifier {
  final databaseReference = FirebaseDatabase.instance.ref();
  List<Course> _featuredCourses = [];
  List<Course> _lessonTitles = [];
  Map<int, Lesson> _lessons = {};

  List<Course> get featuredCourses => _featuredCourses;
  List<Course> get lessonTitles => _lessonTitles;

  CourseProvider() {
    _initializeCourses();
  }

  void _initializeCourses() {
    _featuredCourses = [
      Course(id: 1, title: 'Basic Syntax'),
      Course(id: 2, title: 'Variables'),
      Course(id: 3, title: 'Data Types'),
      Course(id: 4, title: 'Conditions'),
    ];

    _lessonTitles = [
      Course(id: 1, title: 'Basic Syntax'),
      Course(id: 2, title: 'Variables'),
      Course(id: 3, title: 'Data Types'),
      Course(id: 4, title: 'Conditionals'),
      Course(id: 5, title: 'TypeCasting'),
      Course(id: 6, title: 'Exceptions'),
      Course(id: 7, title: 'Functions'),
      Course(id: 8, title: 'Lists'),
      Course(id: 9, title: 'Tuples'),
      Course(id: 10, title: 'Sets'),
      Course(id: 11, title: 'Dictionaries'),
    ];

    notifyListeners();
  }

  Future<void> fetchLessonData(int lessonId) async {
    if (_lessons.containsKey(lessonId)) return;

    try {
      DataSnapshot snapshot = await databaseReference
          .child('courses/introduction_to_python/lessons/$lessonId')
          .get();

      if (snapshot.value != null) {
        Map<String, dynamic> lessonData =
            Map<String, dynamic>.from(snapshot.value as Map);
        _lessons[lessonId] = Lesson(
          id: lessonId,
          title: lessonData['title'] ?? 'Untitled Lesson',
          content:
              (lessonData['content'] as String?)?.replaceAll('\\n', '\n') ??
                  'No content available.',
          additionalContent: (lessonData['additional_content'] as String?)
              ?.replaceAll('\\n', '\n'),
          codeSnippet: (lessonData['code_snippet'] as String?)
                  ?.replaceAll('\\n', '\n') ??
              '# No code snippet available',
        );
        notifyListeners();
      }
    } catch (error) {
      print("Error fetching lesson data: $error");
    }
  }

  Lesson? getLessonById(int lessonId) {
    if (!_lessons.containsKey(lessonId)) {
      fetchLessonData(lessonId);
      return null;
    }
    return _lessons[lessonId];
  }
}
