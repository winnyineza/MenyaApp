import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CourseDetail9 extends StatefulWidget {
  @override
  _CourseDetail9State createState() => _CourseDetail9State();
}

class _CourseDetail9State extends State<CourseDetail9> {

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
              'Tuples',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Color(0xFF0056D2)),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 24, color: Colors.grey[850]),
                children: [
                  TextSpan(
                    text: 'Tuples: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Tuples in Python are ordered, immutable collections of items that can be of any data type. Here are some examples:\n\n',
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
# Create a tuple
fruits = ("apple", "banana", "cherry")
print(fruits)  # Output: ('apple', 'banana', 'cherry')

# Access elements in a tuple
print(fruits[0])  # Output: apple
print(fruits[-1])  # Output: cherry

# Attempt to modify an element in a tuple
try:
    fruits[0] = "orange"
except TypeError:
    print("Error: Tuples are immutable")
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
