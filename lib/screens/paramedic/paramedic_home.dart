import 'package:asafni/screens/paramedic/paramedic_profile_tab.dart';
import 'package:flutter/material.dart';

import 'messages_tab.dart';
import 'notifications_tab.dart';

class ParamedicHome extends StatefulWidget {
  const ParamedicHome({super.key});

  @override
  State<ParamedicHome> createState() => _ParamedicHomeState();
}

class _ParamedicHomeState extends State<ParamedicHome> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = const [
    ParamedicProfileTab(),
    MessagesTab(),
    NotificationsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
        actions: [
          if (_selectedIndex == 0)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // تعديل الملف الشخصي
              },
            ),
        ],
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'الملف الشخصي',
          ),
          NavigationDestination(
            icon: Icon(Icons.message_outlined),
            selectedIcon: Icon(Icons.message),
            label: 'الرسائل',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications),
            label: 'الإشعارات',
          ),
        ],
      ),
    );
  }

  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'الملف الشخصي';
      case 1:
        return 'المحادثات';
      case 2:
        return 'الإشعارات';
      default:
        return 'أسعفني';
    }
  }
}
