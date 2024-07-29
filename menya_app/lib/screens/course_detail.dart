import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import '/provider/course_provider.dart';

class CourseDetail extends StatefulWidget {
  final int lessonId;

  CourseDetail({required this.lessonId});

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  bool _showMore = false;

  void _toggleShowMore() {
    setState(() {
      _showMore = !_showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);
    final lessonData = courseProvider.getLessonById(widget.lessonId);

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
      body: lessonData == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lessonData.title,
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0056D2)),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 24, color: Colors.grey[850]),
                      children: lessonData.content
                          .split('\n')
                          .map(
                              (paragraph) => TextSpan(text: paragraph + '\n\n'))
                          .toList(),
                    ),
                  ),
                  if (_showMore && lessonData.additionalContent != null)
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 24, color: Colors.grey[850]),
                        children: lessonData.additionalContent!
                            .split('\n')
                            .map((paragraph) =>
                                TextSpan(text: paragraph + '\n\n'))
                            .toList(),
                      ),
                    ),
                  if (lessonData.additionalContent != null)
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
                      lessonData.codeSnippet ?? '# No code snippet available',
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
