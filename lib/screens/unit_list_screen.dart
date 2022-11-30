import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/color.dart';

class UnitListView extends StatefulWidget {
  const UnitListView({super.key});

  @override
  State<UnitListView> createState() => _UnitListViewState();
}

class _UnitListViewState extends State<UnitListView> {
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
          searchBar(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          myUnitsWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
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
    List<String> year = ['Year 1', 'Year 2', 'Year 3', 'Year 4'];
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: year.length,
        itemBuilder: (context, int unit) => MyWidgets.buildBox(
          color: Colors.green,
          height: 120,
          width: 100,
          widget: Card(
            child: ListTile(
              title: Text(
                year[unit],
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
