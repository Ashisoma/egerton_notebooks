import 'package:egerton_notebooks/models/faculty.dart';
import 'package:egerton_notebooks/screens/pdf_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/color.dart';

class UnitListView extends StatefulWidget {
  final String course_name;
  const UnitListView({ required this.course_name,super.key});

  @override
  State<UnitListView> createState() => _UnitListViewState();
}

class _UnitListViewState extends State<UnitListView> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background_color,
      appBar: AppBar(
        backgroundColor: MyColors.background_color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: MyColors.backgroud_icon_back_color),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Text(
              widget.course_name,
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
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            MyWidgets.myUnitsWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'Choose Unit',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Expanded(child: courseListView())
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



  courseListView() {
    List<String> year = [
      'Year 1',
      'Year 2',
      'Year 3',
      'Year 4',
      'Year 5',
      'Year 6',
      'Year 7',
      'Year 8'
    ];
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            height: MediaQuery.of(context).size.height * 0.015,
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: year.length,
        itemBuilder: (context, int faculty) => MyWidgets.buildBox(
          // color: Colors.green,
          height: 80,
          widget: Card(
            child: ListTile(
              tileColor: MyColors.backgroud_card_color,
              title: Text(
                year[faculty],
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400, fontSize: 18),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () async {
                await Get.to(() => const PdfListView());
                // go to view the courses
              },
            ),
          ),
        ),
      ),
    );
  }
}
