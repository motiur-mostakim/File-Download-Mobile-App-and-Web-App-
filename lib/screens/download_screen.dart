// import 'package:file_download_app/src/utils/download_function/download_mobile.dart';
import 'package:flutter/material.dart';
import '../src/utils/download_function/download.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  static const downloadUrl =
      'https://morth.nic.in/sites/default/files/dd12-13_0.pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloader File'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            downloadFile(downloadUrl);
          },
          child: const Text('Download File'),
        ),
      ),
    );
  }
}
