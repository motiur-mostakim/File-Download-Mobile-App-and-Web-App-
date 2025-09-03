import 'package:flutter/material.dart';
import '../download.dart';

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
