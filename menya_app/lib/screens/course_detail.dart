import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CourseDetail extends StatefulWidget {
  final int lessonId;

  CourseDetail({required this.lessonId});

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  bool _showMore = false;
  final databaseReference = FirebaseDatabase.instance.ref();
  Map<String, dynamic> lessonData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLessonData();
  }

  void fetchLessonData() {
    databaseReference
        .child('courses/introduction_to_python/lessons/${widget.lessonId}')
        .get()
        .then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        setState(() {
          lessonData = Map<String, dynamic>.from(snapshot.value as Map);
          lessonData['content'] =
              (lessonData['content'] as String?)?.replaceAll('\\n', '\n') ??
                  'No content available.';
          lessonData['additional_content'] =
              (lessonData['additional_content'] as String?)
                  ?.replaceAll('\\n', '\n');
          lessonData['code_snippet'] = (lessonData['code_snippet'] as String?)
                  ?.replaceAll('\\n', '\n') ??
              '# No code snippet available';
          isLoading = false;
        });
      }
    }).catchError((error) {
      print("Error fetching lesson data: $error");
      setState(() {
        isLoading = false;
      });
    });
  }

  void _toggleShowMore() {
    setState(() {
      _showMore = !_showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF0056D2)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Lesson Details',
          style: TextStyle(
              color: Color(0xFF0056D2),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lessonData['title'] ?? 'Untitled Lesson',
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0056D2)),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 24, color: Colors.grey[850]),
                      children: (lessonData['content'] as String)
                          .split('\n')
                          .map(
                              (paragraph) => TextSpan(text: paragraph + '\n\n'))
                          .toList(),
                    ),
                  ),
                  if (_showMore && lessonData['additional_content'] != null)
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 24, color: Colors.grey[850]),
                        children: (lessonData['additional_content'] as String)
                            .split('\n')
                            .map((paragraph) =>
                                TextSpan(text: paragraph + '\n\n'))
                            .toList(),
                      ),
                    ),
                  if (lessonData['additional_content'] != null)
                    TextButton(
                      onPressed: _toggleShowMore,
                      child: Text(
                        _showMore ? 'Show Less' : 'Show More',
                        style:
                            TextStyle(color: Color(0xFF0056D2), fontSize: 18),
                      ),
                    ),
                  SizedBox(height: 20),
                  Text(
                    'Python Code Snippet',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0056D2)),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.grey[200],
                    child: HighlightView(
                      lessonData['code_snippet'] ??
                          '# No code snippet available',
                      language: 'python',
                      theme: githubTheme,
                      textStyle:
                          TextStyle(fontFamily: 'monospace', fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
