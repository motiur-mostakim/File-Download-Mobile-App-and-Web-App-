import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (notificationResponse) async {
      await _onNotificationTap(notificationResponse);
    },
  );
}


Future<void> _onNotificationTap(
    NotificationResponse notificationResponse) async {
  final String? filePath = notificationResponse.payload;
  if (filePath != null) {
    print("Trying to open file: $filePath");
    final result = await OpenFile.open(filePath);
    print("Result: ${result.message}");
  } else {
    print('No valid file path in notification payload.');
  }
}

Future<void> showNotificationWithFile(
    String title, String body, String filePath) async {

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'download_channel',
    'Download Notifications',
    channelDescription: 'Channel for download notifications',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    notificationDetails,
    payload: filePath,
  );
}
