import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CourseDetail4 extends StatefulWidget {
  @override
  _CourseDetail4State createState() => _CourseDetail4State();
}

class _CourseDetail4State extends State<CourseDetail4> {

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
              'Conditionals',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Color(0xFF0056D2)),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 24, color: Colors.grey[850]),
                children: [
                  TextSpan(
                    text: 'Conditionals: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Conditionals in Python are used to execute different blocks of code based on conditions. Here are some examples:\n\n',
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
# If-else statement
x = 5
if x > 10:
    print("x is greater than 10")
else:
    print("x is less than or equal to 10")

# If-elif-else statement
x = 5
if x > 10:
    print("x is greater than 10")
elif x == 5:
    print("x is equal to 5")
else:
    print("x is less than 5")
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
