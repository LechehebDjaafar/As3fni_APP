import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class EmergencyContacts extends StatelessWidget {
  const EmergencyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              ListTile(
                title: const Text('جهات الاتصال في حالات الطوارئ'),
                trailing: TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('إضافة'),
                  onPressed: () {
                    // إضافة جهة اتصال جديدة
                  },
                ),
              ),
              const Divider(),
              ...List.generate(
                _emergencyContacts.length,
                (index) => _buildContactItem(_emergencyContacts[index]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(Map<String, dynamic> contact) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppTheme.primary.withOpacity(0.1),
        child: Text(
          contact['name'][0],
          style: TextStyle(color: AppTheme.primary),
        ),
      ),
      title: Text(contact['name']),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(contact['relation']),
          Text(contact['phone']),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.phone),
        color: AppTheme.primary,
        onPressed: () {
          // اتصال بجهة الاتصال
        },
      ),
    );
  }

  static final List<Map<String, dynamic>> _emergencyContacts = [
    {
      'name': 'أحمد محمد',
      'relation': 'الأب',
      'phone': '+966 50 123 4567',
    },
    {
      'name': 'سارة أحمد',
      'relation': 'الزوجة',
      'phone': '+966 55 987 6543',
    },
    // ... المزيد من جهات الاتصال
  ];
}
