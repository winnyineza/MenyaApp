import 'package:flutter/material.dart';
import 'course_detail.dart';

class CourseList extends StatelessWidget {
  final List<Map<String, dynamic>> lessonTitles = [
    {'id': 1, 'title': 'Basic Syntax'},
    {'id': 2, 'title': 'Variables'},
    {'id': 3, 'title': 'Data Types'},
    {'id': 4, 'title': 'Conditionals'},
    {'id': 5, 'title': 'TypeCasting'},
    {'id': 6, 'title': 'Exceptions'},
    {'id': 7, 'title': 'Functions'},
    {'id': 8, 'title': 'Lists'},
    {'id': 9, 'title': 'Tuples'},
    {'id': 10, 'title': 'Sets'},
    {'id': 11, 'title': 'Dictionaries'}
  ];

  final String courseTitle = 'Introduction \nto Python';
  final String courseDescription = '11 lessons - 8hrs 35min';

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Icon(Icons.book, color: Colors.white),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    courseTitle,
                    style: TextStyle(
                      color: Color(0xFF0056D2),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Course Details',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              courseDescription,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: lessonTitles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CourseDetail(lessonId: lessonTitles[index]['id']),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${lessonTitles[index]['id']}: ${lessonTitles[index]['title']}',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(5.0),
                            child:
                                Icon(Icons.play_arrow, color: Colors.grey[900]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
