import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import '../../../notification_helper.dart';

Future<void> downloadFile(String url) async {
  final fileName = url.split('/').last;

  try {
    final dio = Dio();
    final downloadsDir = Directory('/storage/emulated/0/Download');
    final filePath = '${downloadsDir.path}/$fileName';
    print('-------✅ File saved to:-------${downloadsDir.path}/$fileName');
    await dio.download(url, filePath);
    await showNotificationWithFile("Download Complete", fileName, filePath);

    print("✅ File saved to: $filePath");
    await OpenFile.open(filePath);
  } catch (e) {
    print('❌ Download failed: $e');
  }
}
