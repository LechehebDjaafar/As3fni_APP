import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'medical_history.dart';
import 'emergency_contacts.dart';
import 'settings_screen.dart';

class PatientProfileTab extends StatelessWidget {
  const PatientProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildProfileHeader(),
          _buildInfoSection(),
          _buildMedicalHistoryCard(context),
          _buildEmergencyContactsCard(context),
          _buildSettingsCard(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
          ),
          const SizedBox(height: 16),
          const Text(
            'محمد أحمد',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.bloodtype, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  'فصيلة الدم: A+',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('المعلومات الشخصية', style: AppTheme.subheadingStyle),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.phone, 'رقم الهاتف', '0770 12 34 56'),
            _buildInfoRow(
                Icons.location_on, 'العنوان', 'حي بلوزداد، الجزائر العاصمة'),
            _buildInfoRow(Icons.home, 'الولاية', 'الجزائر العاصمة'),
            _buildInfoRow(Icons.calendar_today, 'العمر', '35 سنة'),
            _buildInfoRow(Icons.medical_services, 'الحالة الصحية', 'مستقرة'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primary, size: 20),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey)),
              Text(value, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalHistoryCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.primary.withOpacity(0.1),
          child: Icon(Icons.medical_information, color: AppTheme.primary),
        ),
        title: const Text('السجل الطبي'),
        subtitle: const Text('عرض التاريخ الطبي والأدوية'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(title: const Text('السجل الطبي')),
                body: const MedicalHistory(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmergencyContactsCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.primary.withOpacity(0.1),
          child: Icon(Icons.contact_phone, color: AppTheme.primary),
        ),
        title: const Text('جهات الاتصال للطوارئ'),
        subtitle: const Text('إدارة جهات الاتصال في حالات الطوارئ'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(title: const Text('جهات اتصال الطوارئ')),
                body: const EmergencyContacts(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSettingsCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.primary.withOpacity(0.1),
          child: Icon(Icons.settings, color: AppTheme.primary),
        ),
        title: const Text('الإعدادات'),
        subtitle: const Text('تخصيص إعدادات التطبيق'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ),
          );
        },
      ),
    );
  }

  static final List<Map<String, dynamic>> _emergencyContacts = [
    {
      'name': 'أحمد بن محمد',
      'relation': 'الأب',
      'phone': '0550 98 76 54',
    },
    {
      'name': 'سارة بوعلام',
      'relation': 'الزوجة',
      'phone': '0770 45 67 89',
    },
    // ... المزيد من جهات الاتصال
  ];
}
