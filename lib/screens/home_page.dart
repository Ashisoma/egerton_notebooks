import 'package:egerton_notebooks/models/faculty.dart';
import 'package:egerton_notebooks/screens/course_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.background_color,
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            searchBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            MyWidgets.myUnitsWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Explore',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Expanded(
              child: facultyListView(),
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

 

  facultyListView() {
    // List<String> faculties = [
    //   'Faculty of Science',
    //   'Faculty of Engineering',
    //   'Faculty of Agriculture',
    //   'Faculty of Arts'
    // ];
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: Faculty.facultyList.length,
      separatorBuilder: (context, index) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.015,
      ),
      itemBuilder: (context, int fcIndex) => MyWidgets.buildBox(
        height: 100,
        width: 80,
        widget: GestureDetector(
          onTap: () async {
            await Get.to(() => CourseListScreen(faculty:Faculty.facultyList[fcIndex],));
          },
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.backgroud_card_color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Faculty of ${Faculty.facultyList[fcIndex].name}",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400, fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
