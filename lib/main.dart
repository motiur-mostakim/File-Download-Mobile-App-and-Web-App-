import 'dart:io';
import 'package:file_download_app/screens/download_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'notification_helper.dart';
import 'download.dart'; // if `requestStoragePermission()` is there

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    // ✅ Initialize notifications
    Future<bool> requestStoragePermission() async {
      if (Platform.isAndroid) {
        if (await Permission.manageExternalStorage.isGranted) {
          return true;
        }

        final status = await Permission.manageExternalStorage.request();
        return status.isGranted;
      }
      return false;
    }
    await initializeNotifications();

    if (Platform.isAndroid) {
      var notificationStatus = await Permission.notification.status;
      if (!notificationStatus.isGranted) {
        notificationStatus = await Permission.notification.request();
      }

      if (notificationStatus.isGranted) {
        bool hasStoragePermission = await requestStoragePermission();
        if (!hasStoragePermission) {
          print('❌ Storage permission not granted');
        } else {
          print('✅ Storage permission granted');
        }
      } else {
        print('❌ Notification permission not granted');
      }
    }
  }

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
      home: DownloadScreen(),
    );
  }
}

