// ignore_for_file: non_constant_identifier_names

import "package:http/http.dart" as http;
import 'package:flutter/material.dart';

import '../models/document.dart';

class DocumentService {

  static const uri = "http://localhost:8080";

  final url = Uri.parse(uri);

  static List<Document> doc_list=[];

  
   Future getAllDocuments() async{

    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("Success!");
      // showSuccessMessage("Success");
    } else {
      print("Failed!");
      // showFailMessage("Failed");
      print(response.body);
    }
    
    //  doc_list = response;
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
}