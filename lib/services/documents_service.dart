import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:flutter/material.dart';

import '../models/document.dart';

class DocumentService {
  static List<Document> doc_list = [];

  static Future<List<Document>> getAllDocuments() async {
    const uri = "http://localhost:8080";

    final url = Uri.parse(uri);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      
      // doc_list = json.asMap();
      doc_list;
      print("Success!");
    } else {
      print("Failed!");
      print(response.statusCode);
    }
    return doc_list;
  }
}

