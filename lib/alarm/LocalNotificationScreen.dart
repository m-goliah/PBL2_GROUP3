import 'package:flutter/material.dart';
import 'package:memo_pbl2/alarm//NotificationPlugin.dart';
import 'package:memo_pbl2/alarm/NotificationScreen.dart';
import 'package:memo_pbl2/memos/memo.dart';

class LocalNotificationScreen extends StatefulWidget {
  @override
  _LocalNotificationScreenState createState() =>
      _LocalNotificationScreenState();
}

class _LocalNotificationScreenState extends State<LocalNotificationScreen> {
  int count = 0;

  // To check the operation of the alarm function
  Memo sampleMemo = new Memo();

  @override
  void initState() {
    super.initState();

    sampleMemo.title = "sample_title";
    sampleMemo.body = "sample_body";
    notificationPlugin
        .setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Notifications'),
      ),
      body: Center(
        // Send an alarm by pressing a button
        child: FlatButton(
          onPressed: () async {
            // Reading title and body of memo
            await notificationPlugin.showNotification(
                sampleMemo.title, sampleMemo.body);

            // await notificationPlugin.scheduleNotification();
            // await notificationPlugin.showNotificationWithAttachment();
            // await notificationPlugin.repeatNotification();
            // await notificationPlugin.showDailyAtTime();
            // await notificationPlugin.showWeeklyAtDayTime();
            // count = await notificationPlugin.getPendingNotificationCount();
            // print('Count $count');
            // await notificationPlugin.cancelNotification();
            // count = await notificationPlugin.getPendingNotificationCount();
            // print('Count $count');
          },
          child: Text('Send Notification'),
        ),
      ),
    );
  }

  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {
    print('Notification Received ${receivedNotification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
    Navigator.push(context, MaterialPageRoute(builder: (coontext) {
      return NotificationScreen(
        payload: payload,
      );
    }));
  }
}
