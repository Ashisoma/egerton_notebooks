import 'dart:convert';

import 'package:egerton_notebooks/models/pdf_mdl.dart';
import 'package:egerton_notebooks/services/documents_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:http/http.dart" as http;

import '../widgets/color.dart';
import '../widgets/custom_drawer.dart';

class PdfListView extends StatefulWidget {
  String? course_name;
  PdfListView({ this.course_name,super.key});

  @override
  State<PdfListView> createState() => _PdfListViewState();
}

class _PdfListViewState extends State<PdfListView> {
  TextEditingController editingController = TextEditingController();
  List pdfs = [];

  @override
  void initState() {
    super.initState();
    // DocumentService().getDocs("Computer Science");
    // get("Computer Science");
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Choose PDF',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w400,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Expanded(
              child: courseListView(),
            )
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

  list() {
    ListView.builder(
        itemCount: pdfs == null ? 0 : pdfs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text("${pdfs[index].fileName}"),
              subtitle: Text("${pdfs[index].courseName}"),
            ),
          ));
        });
  }



  courseListView() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            height: MediaQuery.of(context).size.height * 0.015,
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: pdfs == null ? 0 : pdfs.length,
        itemBuilder: (context, index) => MyWidgets.buildBox(
          // color: Colors.green,
          height: 80,
          widget: Card(
            child: ListTile(
              tileColor: MyColors.backgroud_card_color,
              title: Text(
                "${pdfs[index].fileName}",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400, fontSize: 18),
              ),
              leading: const Icon(
                Icons.picture_as_pdf,
                color: Colors.red,
              ),
              onTap: () async {
                // await Get.to(() => const PdfListView());
                // go to view the courses
              },
            ),
          ),
        ),
      ),
    );
  }
}
