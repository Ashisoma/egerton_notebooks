import 'package:egerton_notebooks/models/faculty.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
            'Explore other courses',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          facultyListView()
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

  facultyListView() {
    List<String> faculties = [
      'Faculty of Science',
      'Faculty of Engineering',
      'Faculty of Agriculture'
    ];
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: faculties.length,
        itemBuilder: (context, int faculty) => Card(
          child: MyWidgets.buildBox(
              color: Colors.green,
              height: 120,
              width: 100,
              widget: Text(
                faculties[faculty],
                
                style:
                    GoogleFonts.nunito(fontWeight: FontWeight.w500, fontSize: 18),
              )),
        ),
      ),
    );
  }
}
