import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PatientMessagesTab extends StatelessWidget {
  const PatientMessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSearchBar(),
        Expanded(
          child: ListView.builder(
            itemCount: _dummyChats.length,
            itemBuilder: (context, index) {
              final chat = _dummyChats[index];
              return _buildChatItem(context, chat);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'البحث في المحادثات',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
      ),
    );
  }

  Widget _buildChatItem(BuildContext context, Map<String, dynamic> chat) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(chat['avatar']),
          ),
          if (chat['isOnline'])
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        chat['name'],
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        chat['lastMessage'],
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            chat['time'],
            style: TextStyle(
              color: chat['unread'] > 0 ? AppTheme.primary : Colors.grey,
              fontSize: 12,
            ),
          ),
          if (chat['unread'] > 0)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                chat['unread'].toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  static final List<Map<String, dynamic>> _dummyChats = [
    {
      'name': 'د. كريم مالك',
      'lastMessage': 'سأصل خلال 10 دقائق',
      'time': 'الآن',
      'unread': 2,
      'avatar': 'https://i.pravatar.cc/150?img=8',
      'isOnline': true,
      'phone': '0550 12 34 56',
      'location': 'حي بلوزداد، الجزائر العاصمة',
    },
    {
      'name': 'د. سارة عمراني',
      'lastMessage': 'تم إرسال التقرير الطبي',
      'time': '12:30',
      'unread': 0,
      'avatar': 'https://i.pravatar.cc/150?img=5',
      'isOnline': false,
      'phone': '0770 98 76 54',
      'location': 'باب الزوار، الجزائر العاصمة',
    },
  ];
}
