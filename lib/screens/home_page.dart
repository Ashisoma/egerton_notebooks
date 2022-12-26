import 'package:egerton_notebooks/models/faculty.dart';
import 'package:egerton_notebooks/screens/course_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/color.dart';
import '../widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController editingController = TextEditingController();

  List<Faculty> _facultyList = Faculty.facultyList;
  List<Faculty> searchList = [];

  @override
  void initState() {
    // TODO: implement initState
    searchList = _facultyList;
    super.initState();
  }

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
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Expanded(
              child: editingController.text.isNotEmpty && searchList.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          const Icon(
                            Icons.search_off_outlined,
                            color: MyColors.backgroud_icon_back_color,
                            size: 35,
                          ),
                          Text(
                            "No results found",
                            style: GoogleFonts.lato(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  : facultyListView(),
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
          // _runFilter(value);
          setState(() {
            searchList = _facultyList
                .where((items) => items.name
                    .toString()
                    .toLowerCase()
                    .contains(value.toLowerCase()))
                .toList();
          });
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
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: editingController.text.isNotEmpty
          ? searchList.length
          : _facultyList.length,
      separatorBuilder: (context, index) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.015,
      ),
      itemBuilder: (context, int fcIndex) => MyWidgets.buildBox(
        height: 100,
        width: 80,
        widget: GestureDetector(
          onTap: () async {
            await Get.to(() => CourseListScreen(
                  faculty: editingController.text.isNotEmpty
                      ? searchList[fcIndex]
                      : _facultyList[fcIndex],
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.backgroud_card_color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Faculty of ${editingController.text.isNotEmpty ? searchList[fcIndex].name : _facultyList[fcIndex].name}",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400, fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _runFilter(String value) {
    List<Faculty> filterList = [];

    if (value.isEmpty) {
      filterList = _facultyList;
    } else {
      filterList = _facultyList
          .where(
              (items) => items.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }

    setState(() {
      searchList = filterList;
    });
  }
}
