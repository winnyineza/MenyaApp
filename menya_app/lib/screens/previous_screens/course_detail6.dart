import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CourseDetail6 extends StatefulWidget {
  @override
  _CourseDetail6State createState() => _CourseDetail6State();
}

class _CourseDetail6State extends State<CourseDetail6> {

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
          style: TextStyle(color: Color(0xFF0056D2), fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exceptions',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Color(0xFF0056D2)),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 24, color: Colors.grey[850]),
                children: [
                  TextSpan(
                    text: 'Exceptions: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Exceptions in Python are used to handle errors and exceptions that occur during the execution of a program. Here are some examples:\n\n',
                  ),

                ],
              ),
            ),

            Text(
              'Python Code Snippet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0056D2)),
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: HighlightView(
                '''
# Try-except block
try:
    x = 5 / 0
except ZeroDivisionError:
    print("Error: Division by zero is not allowed")

# Try-except-else block
try:
    x = 5 / 2
except ZeroDivisionError:
    print("Error: Division by zero is not allowed")
else:
    print("Division successful")
''',
                language: 'python',
                theme: githubTheme,
                textStyle: TextStyle(fontFamily: 'monospace', fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
