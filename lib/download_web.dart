import 'dart:html' as html;

Future<void> downloadFile(String url) async {
  final fileName = url.split('/').last;
  final anchor = html.AnchorElement(href: url)
    ..target = 'blank'
    ..download = fileName
    ..click();
}
