import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ParamedicProfileView extends StatelessWidget {
  final Map<String, dynamic> paramedic;

  const ParamedicProfileView({super.key, required this.paramedic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildInfoSection(),
                _buildContactButtons(),
                _buildQualifications(),
                _buildReviews(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(paramedic['name']),
        background: Image.network(
          paramedic['image'],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              Text(' ${paramedic['rating']}'),
              const SizedBox(width: 16),
              Icon(Icons.location_on, color: AppTheme.primary),
              Text(' ${paramedic['distance']} كم'),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'التخصص: ${paramedic['speciality']}',
            style: AppTheme.subheadingStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildContactButtons() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.call),
              label: const Text('اتصال'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.message),
              label: const Text('رسالة'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQualifications() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.school, color: AppTheme.primary),
                const SizedBox(width: 8),
                Text('المؤهلات والشهادات', style: AppTheme.subheadingStyle),
              ],
            ),
            const SizedBox(height: 16),
            _buildQualificationItem(
              'بكالوريوس طب وجراحة',
              '2015 - جامعة الملك سعود',
            ),
            _buildQualificationItem(
              'دبلوم إسعافات أولية متقدمة',
              '2016 - الهلال الأحمر السعودي',
            ),
            _buildQualificationItem(
              'شهادة BLS معتمدة',
              '2020 - الجمعية الأمريكية للقلب',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQualificationItem(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildReviews() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('التقييمات', style: AppTheme.subheadingStyle),
                TextButton(
                  onPressed: () {},
                  child: const Text('عرض الكل'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildReviewItem(
              'محمد علي',
              4.5,
              'خدمة ممتازة وسرعة في الاستجابة',
              '2 أيام',
            ),
            _buildReviewItem(
              'سارة أحمد',
              5.0,
              'مسعف محترف ومتعاون',
              'أسبوع',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewItem(
      String name, double rating, String comment, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(time, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ...List.generate(
                5,
                (index) => Icon(
                  index < rating.floor() ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                rating.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(comment),
          const Divider(),
        ],
      ),
    );
  }
}
