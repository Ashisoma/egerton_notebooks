import 'package:egerton_notebooks/models/faculty.dart';
import 'package:egerton_notebooks/screens/unit_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/color.dart';
import '../widgets/custom_drawer.dart';

class CourseListScreen extends StatefulWidget {
  final Faculty faculty;
  const CourseListScreen({super.key, required this.faculty});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  TextEditingController editingController = TextEditingController();

  // Faculty facultyList = widget.faculty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background_color,
      appBar: AppBar(
        backgroundColor: MyColors.background_color,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: MyColors.backgroud_icon_back_color),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Text(
              'eger',
              style: GoogleFonts.lato(
                  decoration: TextDecoration.underline, fontSize: 18),
            ),
            Text(
              'NOTES',
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.menu,
                color: MyColors.backgroud_icon_back_color,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            searchBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            MyWidgets.myUnitsWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Faculty of ${widget.faculty.name}',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: MediaQuery.of(context).size.height * 0.015,
                  );
                },
                scrollDirection: Axis.vertical,
                itemCount: widget.faculty.courses.length,
                itemBuilder: (context, int faculty) => MyWidgets.buildBox(
                  // color: Colors.green,
                  height: 80,
                  widget: Card(
                    child: ListTile(
                      tileColor: MyColors.backgroud_card_color,
                      title: Text(
                        widget.faculty.courses[faculty].dept_name,
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        Get.to(() =>  UnitListView(course_name: widget.faculty.courses[faculty].dept_name));
                        // go to view the courses
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  searchBar() {
    return SizedBox(
      child: TextField(
        onChanged: (value) {
          // filterSearchResults(value);
        },
        controller: editingController,
        decoration: const InputDecoration(
          // labelText: "Search",
          hintText: "Search",
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }


}
