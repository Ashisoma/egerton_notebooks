import 'package:egerton_notebooks/models/document.dart';
import 'package:egerton_notebooks/screens/reader_screen.dart';
import 'package:egerton_notebooks/services/documents_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Document> documents = [];

  @override
  void initState() {
    // TODO: implement initState

    fetchDocuments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book List View"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            // children: DocumentService.doc_list
            //     .map((doc) => Card(
            //           child: ListTile(
            //             onTap: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => ReaderScreen(doc)));
            //             },
            //             leading: const Icon(
            //               Icons.picture_as_pdf,
            //               color: Colors.red,
            //               size: 18.0,
            //             ),
            //             title: Text(
            //               doc.doc_title!,
            //               style: GoogleFonts.nunito(),
            //               overflow: TextOverflow.ellipsis,
            //             ),
            //             subtitle: Text("${doc.page_num!} Pages"),
            //             trailing: Text(
            //               doc.doc_size!,
            //               style: GoogleFonts.nunito(color: Colors.grey),
            //             ),
            //           ),
            //         ))
            //     .toList(),
            children: [
              ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final doc = documents[index];
                    return ListTile(
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
                        //             ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  void showSuccessMessage(String message, BuildContext context) {
    final snackbar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.greenAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showFailMessage(String message, BuildContext context) {
    final snackbar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future<void> fetchDocuments() async {
    final response = DocumentService.getAllDocuments();
  }
}
