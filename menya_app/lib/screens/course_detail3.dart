import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CourseDetail3 extends StatefulWidget {
  @override
  _CourseDetail3State createState() => _CourseDetail3State();
}

class _CourseDetail3State extends State<CourseDetail3> {
  bool _showMore = false;

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
          style: TextStyle(color: Color(0xFF0056D2), fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Types',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Color(0xFF0056D2)),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 24, color: Colors.grey[850]),
                children: [
                  TextSpan(
                    text: 'Python has several built-in data types:\n\n',
                  ),
                  TextSpan(
                    text: 'Integers: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Whole numbers, like 1, 2, or 3.\n\n',
                  ),
                  TextSpan(
                    text: 'Floats: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Decimal numbers, like 3.14 or -0.5.\n\n',
                  ),
                  if (_showMore) ...[
                    TextSpan(
                      text: 'Strings: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Sequences of characters, like "hello" or \'hello\'.\n\n',
                    ),
                    TextSpan(
                      text: 'Boolean: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Values that can be either True or False.\n\n',
                    ),
                    TextSpan(
                      text: 'List: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Ordered collections of items, like [1, 2, 3].\n\n',
                    ),
                    TextSpan(
                      text: 'Tuple: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Ordered, immutable collections of items, like (1, 2, 3).\n\n',
                    ),
                    TextSpan(
                      text: 'Set: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Unordered collections of unique items, like {1, 2, 3}.\n\n',
                    ),
                    TextSpan(
                      text: 'Dictionary: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Unordered collections of key-value pairs, like {"name": "John", "age": 30}.',
                    ),
                  ],
                ],
              ),
            ),
            TextButton(
              onPressed: _toggleShowMore,
              child: Text(
                _showMore ? 'Show Less' : 'Show More',
                style: TextStyle(color: Color(0xFF0056D2), fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Python Code Snippet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0056D2)),
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: HighlightView(
                '''
# Integer
x = 5
print(type(x))  # Output: <class 'int'>

# Float
y = 3.14
print(type(y))  # Output: <class 'float'>

# String
z = "hello"
print(type(z))  # Output: <class 'str'>

# Boolean
is_admin = True
print(type(is_admin))  # Output: <class 'bool'>
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
