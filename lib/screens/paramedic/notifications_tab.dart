import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/notification_model.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: AppTheme.primary,
            child: const TabBar(
              tabs: [
                Tab(text: 'غير مقروءة'),
                Tab(text: 'الكل'),
              ],
              indicatorColor: Colors.white,
              labelColor: Colors.white,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildNotificationsList(_unreadNotifications),
                _buildNotificationsList(_allNotifications),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList(List<NotificationModel> notifications) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _buildNotificationCard(notification);
      },
    );
  }

  Widget _buildNotificationCard(NotificationModel notification) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getNotificationColor(notification.type),
          child: Icon(
            _getNotificationIcon(notification.type),
            color: Colors.white,
          ),
        ),
        title: Text(
          notification.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.message),
            const SizedBox(height: 4),
            Text(
              notification.time,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        trailing: notification.isRead
            ? null
            : Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
      ),
    );
  }

  Color _getNotificationColor(String type) {
    switch (type) {
      case 'emergency':
        return Colors.red;
      case 'message':
        return Colors.blue;
      case 'update':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'emergency':
        return Icons.emergency;
      case 'message':
        return Icons.message;
      case 'update':
        return Icons.update;
      default:
        return Icons.notifications;
    }
  }

  // بيانات افتراضية
  static final List<NotificationModel> _allNotifications = [
    NotificationModel(
      id: '1',
      title: 'حالة طارئة جديدة',
      message: 'يوجد مريض بحاجة إلى مساعدة طبية عاجلة في حي النزهة',
      time: 'منذ 5 دقائق',
      type: 'emergency',
    ),
    NotificationModel(
      id: '2',
      title: 'رسالة جديدة',
      message: 'لديك رسالة جديدة من أحمد محمد',
      time: 'منذ ساعة',
      type: 'message',
      isRead: true,
    ),
    // ... المزيد من الإشعارات
  ];

  static final List<NotificationModel> _unreadNotifications =
      _allNotifications.where((n) => !n.isRead).toList();
}
