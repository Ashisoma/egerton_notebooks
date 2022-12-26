import 'package:egerton_notebooks/models/faculty.dart';
import 'package:egerton_notebooks/models/pdf_mdl.dart';
import 'package:egerton_notebooks/screens/pdf_list_view.dart';
import 'package:egerton_notebooks/services/documents_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/color.dart';
import '../widgets/custom_drawer.dart';

class UnitListView extends StatefulWidget {
  final String course_name;
  const UnitListView({required this.course_name, super.key});

  @override
  State<UnitListView> createState() => _UnitListViewState();
}

class _UnitListViewState extends State<UnitListView> {
  late List<PdfModel>? _pdfList = [];

  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    getAllDocuments(widget.course_name);

    _getData();
    super.initState();
  }

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
            Expanded(
              child: courseListView(),
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

  courseListView() {
    return SizedBox(
      height: 120,
      child: _pdfList == null || _pdfList!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  height: MediaQuery.of(context).size.height * 0.015,
                );
              },
              scrollDirection: Axis.vertical,
              itemCount: _pdfList!.length,
              itemBuilder: (context, int faculty) => MyWidgets.buildBox(
                // color: Colors.green,
                height: 80,
                widget: Card(
                  child: ListTile(
                    tileColor: MyColors.backgroud_card_color,
                    title: Text(
                      "${_pdfList![faculty].fileName}",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () async {
                      await Get.to(() => PdfListView(course_name: _pdfList![faculty].courseName));
                      // go to view the courses
                    },
                  ),
                ),
              ),
            ),
    );
  }

  Future getAllDocuments(String query) async {
    final response = await DocumentService().get(query);
    if (response.statusCode == 200) {
      print("================Success============");
      print(response.body);
    } else {
      print("================Error============");
      print(response.statusCode);
    }
  }

  void _getData() async {
    _pdfList = (await DocumentService().getDocuments(widget.course_name));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
}
