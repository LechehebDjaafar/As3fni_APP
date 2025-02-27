import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class MessagesTab extends StatelessWidget {
  const MessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSearchBar(),
        _buildFilterChips(),
        Expanded(
          child: ListView.builder(
            itemCount: _dummyChats.length,
            itemBuilder: (context, index) => _buildChatItem(_dummyChats[index]),
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
          hintText: 'بحث في الرسائل',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _buildChip('الكل', true),
          _buildChip('غير مقروءة', false),
          _buildChip('مهمة', false),
          _buildChip('طوارئ', false),
        ],
      ),
    );
  }

  Widget _buildChip(String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (bool value) {},
        backgroundColor: Colors.white,
        selectedColor: AppTheme.primary.withOpacity(0.2),
        checkmarkColor: AppTheme.primary,
      ),
    );
  }

  Widget _buildChatItem(Map<String, dynamic> chat) {
    return InkWell(
      onTap: () {
        // فتح المحادثة
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(chat['avatar']),
                ),
                if (chat['online'])
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chat['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        chat['time'],
                        style: TextStyle(
                          color: chat['unread'] > 0
                              ? AppTheme.primary
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat['lastMessage'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: chat['unread'] > 0
                                ? Colors.black87
                                : Colors.grey,
                          ),
                        ),
                      ),
                      if (chat['unread'] > 0)
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppTheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            chat['unread'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static final List<Map<String, dynamic>> _dummyChats = [
    {
      'name': 'سارة أحمد',
      'lastMessage': 'شكراً جزيلاً على المساعدة السريعة',
      'time': '12:30',
      'unread': 2,
      'avatar': 'https://i.pravatar.cc/150?img=1',
      'online': true,
    },
    {
      'name': 'محمد علي',
      'lastMessage': 'هل يمكنك الوصول خلال 10 دقائق؟',
      'time': '10:15',
      'unread': 1,
      'avatar': 'https://i.pravatar.cc/150?img=2',
      'online': false,
    },
    // ... المزيد من المحادثات
  ];
}
