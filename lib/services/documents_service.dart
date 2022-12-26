import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';
import "package:http/http.dart" as http;

import '../models/document.dart';
import '../models/pdf_mdl.dart';

const String URL = "https://egerton-notebooks.herokuapp.com/";

class DocumentService {
  List<PdfModel> doc_list = [];

  var client = http.Client();

  Future<dynamic> get(String query) async {
    var url = Uri.parse("$URL/search/$query");
    var response = await client.get(url);

    return response;
    // create a doc models
  }

  Future<List<PdfModel>?> getDocuments(String query) async {
    try {
      var url = Uri.parse("$URL/search/$query");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<PdfModel> _models = pdfModelFromJson(response.body);
        return _models;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
