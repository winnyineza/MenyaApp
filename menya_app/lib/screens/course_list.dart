import 'package:flutter/material.dart';
import 'course_detail1.dart';
import 'course_detail2.dart';
import 'course_detail3.dart';
import 'course_detail4.dart';
import 'course_detail5.dart';
import 'course_detail6.dart';
import 'course_detail7.dart';
import 'course_detail8.dart';
import 'course_detail9.dart';
import 'course_detail10.dart';
import 'course_detail11.dart';

class CourseList extends StatelessWidget {
  final List<String> lessonTitles = [
    '1: Basic Syntax',
    '2: Variables',
    '3: Data Types',
    '4: Conditionals',
    '5: TypeCasting',
    '6: Exceptions',
    '7: Functions',
    '8: Lists',
    '9: Tuples',
    '10: Sets',
    '11: Dictionaries'
  ];

  final List<Widget> detailPages = [
    CourseDetail1(),
    CourseDetail2(),
    CourseDetail3(),
    CourseDetail4(),
    CourseDetail5(),
    CourseDetail6(),
    CourseDetail7(),
    CourseDetail8(),
    CourseDetail9(),
    CourseDetail10(),
    CourseDetail11(),
  ];

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
                Text(
                  'Introduction \nto Python',
                  style: TextStyle(
                    color: Color(0xFF0056D2),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Course Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              '11 lessons - 8hrs 35min',
              style: TextStyle(color: Colors.grey[600]),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lessonTitles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => detailPages[index]),
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
                            lessonTitles[index],
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(5.0),
                            child: Icon(Icons.play_arrow, color: Colors.grey[900]),
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
