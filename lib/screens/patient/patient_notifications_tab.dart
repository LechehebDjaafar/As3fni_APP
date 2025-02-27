import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PatientNotificationsTab extends StatelessWidget {
  const PatientNotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _notifications.length,
      itemBuilder: (context, index) {
        final notification = _notifications[index];
        return _buildNotificationCard(notification);
      },
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notification) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getNotificationColor(notification['type']),
          child: Icon(
            _getNotificationIcon(notification['type']),
            color: Colors.white,
          ),
        ),
        title: Text(
          notification['title'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification['message']),
            Text(
              notification['time'],
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Color _getNotificationColor(String type) {
    switch (type) {
      case 'emergency':
        return Colors.red;
      case 'appointment':
        return Colors.blue;
      case 'info':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'emergency':
        return Icons.emergency;
      case 'appointment':
        return Icons.calendar_today;
      case 'info':
        return Icons.info;
      default:
        return Icons.notifications;
    }
  }

  static final List<Map<String, dynamic>> _notifications = [
    {
      'type': 'emergency',
      'title': 'تم تأكيد طلب المساعدة',
      'message': 'المسعف د. أحمد محمد في طريقه إليك',
      'time': 'منذ دقيقتين',
    },
    {
      'type': 'appointment',
      'title': 'تذكير بالموعد',
      'message': 'موعد المتابعة مع د. سارة غداً الساعة 10 صباحاً',
      'time': 'منذ ساعة',
    },
    // ... المزيد من الإشعارات
  ];
}
