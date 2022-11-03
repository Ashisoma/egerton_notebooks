import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/faculty.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage(this.dept, {super.key});
  final List<Department> dept;

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Department"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.dept
                .map((depatment) => Card(
                      child: ListTile(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DepartmentPage(depatment.dept_name!)));
                        },
                        leading: const Icon(
                          Icons.school,
                          color: Colors.greenAccent,
                          size: 18.0,
                        ),
                        title: Text(
                          depatment.dept_name,
                          style: GoogleFonts.nunito(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          depatment.facltyName,
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