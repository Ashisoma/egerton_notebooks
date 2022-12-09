class Document {

  // app.quicktype.io
   String? doc_title, doc_url, doc_size, page_num;

   Document({ this.doc_title, this.doc_url, this.doc_size, this.page_num});


 static List<Document> products = [
   Document(doc_size: '20', doc_title: '', doc_url: '', page_num: '' )

  ];


  factory Document.fromJson(Map<String, dynamic> json) => Document(
    doc_size : json["doc_size"],
    doc_title : json["doc_title"],
    page_num : json["page_num"],
    doc_url : json["doc_url"],
  );
}