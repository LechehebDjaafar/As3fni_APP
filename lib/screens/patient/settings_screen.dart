import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _locationEnabled = true;
  String _language = 'العربية';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: ListView(
        children: [
          _buildSection(
            'الإشعارات والأذونات',
            [
              SwitchListTile(
                title: const Text('الإشعارات'),
                subtitle: const Text('تلقي إشعارات التطبيق'),
                value: _notificationsEnabled,
                onChanged: (value) =>
                    setState(() => _notificationsEnabled = value),
              ),
              SwitchListTile(
                title: const Text('خدمات الموقع'),
                subtitle: const Text('السماح بالوصول إلى موقعك'),
                value: _locationEnabled,
                onChanged: (value) => setState(() => _locationEnabled = value),
              ),
            ],
          ),
          _buildSection(
            'الخصوصية والأمان',
            [
              ListTile(
                leading: const Icon(Icons.lock_outline),
                title: const Text('تغيير كلمة المرور'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // فتح صفحة تغيير كلمة المرور
                },
              ),
              ListTile(
                leading: const Icon(Icons.security),
                title: const Text('المصادقة الثنائية'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // فتح إعدادات المصادقة الثنائية
                },
              ),
            ],
          ),
          _buildSection(
            'التفضيلات',
            [
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('اللغة'),
                trailing: DropdownButton<String>(
                  value: _language,
                  onChanged: (value) => setState(() => _language = value!),
                  items: const [
                    DropdownMenuItem(value: 'العربية', child: Text('العربية')),
                    DropdownMenuItem(value: 'English', child: Text('English')),
                  ],
                ),
              ),
            ],
          ),
          _buildSection(
            'الدعم والمساعدة',
            [
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text('مركز المساعدة'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // فتح مركز المساعدة
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_support_outlined),
                title: const Text('تواصل معنا'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // فتح صفحة التواصل
                },
              ),
            ],
          ),
          _buildSection(
            'عن التطبيق',
            [
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('الإصدار'),
                trailing: const Text('1.0.0'),
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text('سياسة الخصوصية'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // فتح سياسة الخصوصية
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                // تسجيل الخروج
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('تسجيل الخروج'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        ...children,
        const Divider(),
      ],
    );
  }
}
