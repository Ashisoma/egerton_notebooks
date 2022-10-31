import 'package:egerton_notebooks/models/document.dart';
import 'package:egerton_notebooks/screens/reader_screen.dart';
import 'package:egerton_notebooks/services/documents_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: DocumentService.doc_list
                .map((doc) => Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReaderScreen(doc)));
                        },
                        leading: const Icon(
                          Icons.picture_as_pdf,
                          color: Colors.red,
                          size: 18.0,
                        ),
                        title: Text(
                          doc.doc_title!,
                          style: GoogleFonts.nunito(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text("${doc.page_num!} Pages"),
                        trailing: Text(
                          doc.doc_size!,
                          style: GoogleFonts.nunito(color: Colors.grey),
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
