import 'package:flutter/material.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(child: ListTile(
            leading: Icon(Icons.school, color: Colors.greenAccent,),
            title: Text("Course Name"),
          )),
        ],
      ),
    );
  }
}