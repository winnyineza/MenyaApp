import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'course_detail.dart';
import '/provider/course_provider.dart';

class CourseList extends StatelessWidget {
  final String courseTitle = 'Introduction \nto Python';
  final String courseDescription = '11 lessons - 8hrs 35min';

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);

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
                itemCount: courseProvider.lessonTitles.length,
                itemBuilder: (context, index) {
                  final lesson = courseProvider.lessonTitles[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CourseDetail(lessonId: lesson.id),
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
                            '${lesson.id}: ${lesson.title}',
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
