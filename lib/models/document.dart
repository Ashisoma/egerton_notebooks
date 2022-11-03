class Document {
  final String doc_title, doc_url, doc_size, page_num;

  const Document({required this.doc_title,required this.doc_url,required this.doc_size,required this.page_num});


 static const List<Document> products = [
   Document(doc_size: '20', doc_title: '', doc_url: '', page_num: '' )

  ];
}