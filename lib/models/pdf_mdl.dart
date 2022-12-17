class PDFModel {
  String? fileId;
  String? fileName;
  String? facultyName;
  String? courseName;
  String? downloadUrl;
  String? fileType;
  int? fileSize;

  PDFModel(
      {this.fileId,
      this.fileName,
      this.facultyName,
      this.courseName,
      this.downloadUrl,
      this.fileType,
      this.fileSize});

  PDFModel.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    fileName = json['fileName'];
    facultyName = json['facultyName'];
    courseName = json['courseName'];
    downloadUrl = json['downloadUrl'];
    fileType = json['fileType'];
    fileSize = json['fileSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileId'] = this.fileId;
    data['fileName'] = this.fileName;
    data['facultyName'] = this.facultyName;
    data['courseName'] = this.courseName;
    data['downloadUrl'] = this.downloadUrl;
    data['fileType'] = this.fileType;
    data['fileSize'] = this.fileSize;
    return data;
  }
}