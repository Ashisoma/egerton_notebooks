import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';

class FacultyPage extends StatefulWidget {
  const FacultyPage({super.key});

  @override
  State<FacultyPage> createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Card(child: ListTile(
            leading: Icon(Icons.school, color: Colors.greenAccent,),
            title: Text("Course Name"),
          )),
        ],
      ),
    );
  }
}