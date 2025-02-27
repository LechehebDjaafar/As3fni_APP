import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'search_paramedics_tab.dart';
import 'patient_messages_tab.dart';
import 'patient_notifications_tab.dart';
import 'patient_profile_tab.dart';

class PatientMain extends StatefulWidget {
  const PatientMain({super.key});

  @override
  State<PatientMain> createState() => _PatientMainState();
}

class _PatientMainState extends State<PatientMain> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    SearchParamedicsTab(),
    PatientMessagesTab(),
    PatientNotificationsTab(),
    PatientProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _getTitle(),
        actions: _getActions(),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        backgroundColor: Colors.white,
        elevation: 8,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.search, color: AppTheme.primary),
            label: 'بحث',
          ),
          NavigationDestination(
            icon: Icon(Icons.message_outlined),
            selectedIcon: Icon(Icons.message, color: AppTheme.primary),
            label: 'الرسائل',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications, color: AppTheme.primary),
            label: 'الإشعارات',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: AppTheme.primary),
            label: 'الملف الشخصي',
          ),
        ],
      ),
    );
  }

  Widget _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return const Text('البحث عن مسعف');
      case 1:
        return const Text('المحادثات');
      case 2:
        return const Text('الإشعارات');
      case 3:
        return const Text('الملف الشخصي');
      default:
        return const Text('أسعفني');
    }
  }

  List<Widget> _getActions() {
    if (_selectedIndex == 0) {
      return [
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            // عرض خيارات التصفية
          },
        ),
      ];
    }
    return [];
  }
}
