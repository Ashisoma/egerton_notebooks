import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import "package:http/http.dart" as http;

import '../models/document.dart';
import '../models/pdf_mdl.dart';

const String URL = "https://egerton-notebooks.herokuapp.com/";

class DocumentService {
  List<PDFModel> doc_list = [];

  var client = http.Client();

  Future<dynamic> get(String query) async {
    var url = Uri.parse("$URL/search/$query");
    var response = await client.get(url);

    return response;
    // create a doc models
  }

  // Future<List> getDocs(String query) async {
  //   var url = Uri.parse("$URL/search/$query");

  //   var res = await client.get(url);
  //   if (res.statusCode == 200) {
  //     List<PDFModel> body = jsonDecode(res.body);
  //     List pdfs = body.map((dynamic item) => PDFModel.fromJson(item)).toList();

  //     return pdfs;
  //   } else {
  //     throw "Failed to load pdfs list";
  //   }
  // }
}
