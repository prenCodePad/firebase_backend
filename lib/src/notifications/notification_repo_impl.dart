import 'package:dio/dio.dart';
import 'package:firebase_backend/src/config/dio_setup.dart';
import 'package:firebase_backend/src/models/notification_response.dart';
import 'package:firebase_backend/src/notifications/notification_repo.dart';

class NotificationRepositoryImpl extends NotificationRepositiory {
  const NotificationRepositoryImpl();

  @override
  Future<void> sendMessagePushNotification(NotificationResponse notification) async {
    FirebaseDio dio = FirebaseDio(
        key:
            'AAAAaNIFBS8:APA91bEwNORIHx00oqVmf-LJZxvaJJcNeo7rdJa7Llw8rMdanocIx56yCW0u7ISEoZ4ewVXp77ZMg1JtNroUY0QKDxR6PHGa2lz0XL8xKuUUg87YbJou_68-Oh-mE1Y2QO6g7cjQPYbn');
    await dio.create().post(
          'https://fcm.googleapis.com/fcm/send',
          data: NotificationResponse.notificationToRequestJson(notification),
        );
  }

  @override
  Future<void> configureFCMPushNotification() async {}
}
