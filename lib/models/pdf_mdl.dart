// To parse this JSON data, do
//
//     final pdfModel = pdfModelFromJson(jsonString);

import 'dart:convert';

List<PdfModel> pdfModelFromJson(String str) => List<PdfModel>.from(json.decode(str).map((x) => PdfModel.fromJson(x)));

String pdfModelToJson(List<PdfModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PdfModel {
    PdfModel({
        this.fileId,
        this.fileName,
        this.facultyName,
        this.courseName,
        this.downloadUrl,
        this.fileType,
        this.fileSize,
    });

    String? fileId;
    String? fileName;
    String? facultyName;
    String? courseName;
    String? downloadUrl;
    String? fileType;
    int? fileSize;

    factory PdfModel.fromJson(Map<String, dynamic> json) => PdfModel(
        fileId: json["fileId"],
        fileName: json["fileName"],
        facultyName: json["facultyName"],
        courseName: json["courseName"],
        downloadUrl: json["downloadUrl"],
        fileType: json["fileType"],
        fileSize: json["fileSize"],
    );

    Map<String, dynamic> toJson() => {
        "fileId": fileId,
        "fileName": fileName,
        "facultyName": facultyName,
        "courseName": courseName,
        "downloadUrl": downloadUrl,
        "fileType": fileType,
        "fileSize": fileSize,
    };
}
