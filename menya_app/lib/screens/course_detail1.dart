import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CourseDetail1 extends StatefulWidget {
  @override
  _CourseDetail1State createState() => _CourseDetail1State();
}

class _CourseDetail1State extends State<CourseDetail1> {
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
              'Basic Syntax',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Color(0xFF0056D2)),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 24, color: Colors.grey[850]),
                children: [
                  TextSpan(
                    text: 'Indentation: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Python uses indentation (spaces or tabs) to define code blocks, instead of curly braces or keywords like other languages. The amount of indentation matters - it tells Python where blocks of code begin and end.\n\n',
                  ),
                  TextSpan(
                    text: 'Variables: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'You create variables in Python by assigning a value to a name, using the = operator. Variable names can contain letters, digits, and underscores, but they must start with a letter or underscore.\n\n',
                  ),
                  if (_showMore) ...[
                    TextSpan(
                      text: 'Data Types: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Python has several built-in data types, including integers, floats, strings, booleans, lists, tuples, and dictionaries. The type of a variable is determined by the value assigned to it.\n\n',
                    ),
                    TextSpan(
                      text: 'Printing: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'To display output, you use the print() function, passing in the value you want to print, which can be a variable, a string, or an expression.\n\n',
                    ),
                    TextSpan(
                      text: 'Comments: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'You add comments to your code using the # symbol. Anything after the # on that line will be ignored by the Python interpreter.\n\n',
                    ),
                    TextSpan(
                      text: 'Functions: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'You define functions using the def keyword, followed by the function name and a colon. The function code is indented, and the function is called by its name.\n\n',
                    ),
                    TextSpan(
                      text: 'Conditionals: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'You use if, elif, and else statements to execute different blocks of code based on conditions.\n\n',
                    ),
                    TextSpan(
                      text: 'Loops: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Python has for and while loops to repeatedly execute a block of code.',
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
# This is a comment - anything after the "#" symbol is ignored by the interpreter

# Print a message to the console
print("Hello, World!")

# Ask the user for their name
name = input("What is your name? ")

# Print a greeting with the user's name
print("Hello, " + name + "!")
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
