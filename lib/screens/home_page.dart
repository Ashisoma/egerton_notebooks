import 'package:egerton_notebooks/models/document.dart';
import 'package:egerton_notebooks/screens/department.dart';
import 'package:egerton_notebooks/screens/reader_screen.dart';
import 'package:egerton_notebooks/services/documents_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/faculty.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Egerton Notebooks"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: Faculty.facultyList
                .map((faclty) => Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DepartmentPage(faclty.dept!)));
                        },
                        leading: const Icon(
                          Icons.picture_as_pdf,
                          color: Colors.red,
                          size: 18.0,
                        ),
                        title: Text(
                          faclty.name,
                          style: GoogleFonts.nunito(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
