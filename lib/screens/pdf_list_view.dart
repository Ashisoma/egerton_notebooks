import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/color.dart';

class PdfListView extends StatefulWidget {
  const PdfListView({super.key});

  @override
  State<PdfListView> createState() => _PdfListViewState();
}

class _PdfListViewState extends State<PdfListView> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [IconButton(onPressed: (() {}), icon: const Icon(Icons.menu))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            'Choose PDF',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          courseListView()
        ],
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

  Container myUnitsWidget() {
    return Container();
  }

  courseListView() {
    List<String> pdfs = ['Kemei', 'Kabira', 'Topic 3', 'K Maps'];
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: pdfs.length,
        itemBuilder: (context, int unit) => MyWidgets.buildBox(
          color: Colors.green,
          height: 120,
          width: 100,
          widget: Card(
            child: ListTile(
              title: Text(
                pdfs[unit],
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w500, fontSize: 18),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // go to view the courses
              },
            ),
          ),
        ),
      ),
    );
  }
}
