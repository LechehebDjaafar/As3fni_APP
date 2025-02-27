import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ParamedicProfileTab extends StatelessWidget {
  const ParamedicProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildStats(),
          _buildInfo(),
          _buildAvailabilityCard(),
          _buildQualifications(),
          _buildReviews(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.primary, AppTheme.primary.withOpacity(0.8)],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      AssetImage('assets/images/doctor_avatar.png'),
                ),
                const SizedBox(height: 8),
                const Text(
                  'د. أحمد محمد',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'مسعف متخصص',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('التقييم', '4.8', Icons.star),
          _buildStatItem('الحالات', '127', Icons.medical_services),
          _buildStatItem('الخبرة', '5 سنوات', Icons.timer),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.primary),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildInfo() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('المعلومات الشخصية', style: AppTheme.subheadingStyle),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.phone, 'رقم الهاتف', '+966 50 123 4567'),
            _buildInfoRow(Icons.location_on, 'المنطقة', 'الرياض'),
            _buildInfoRow(Icons.work, 'التخصص', 'إسعافات أولية متقدمة'),
            _buildInfoRow(Icons.badge, 'رقم الترخيص', 'MD123456'),
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

  Widget _buildAvailabilityCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      color: AppTheme.secondary.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.check_circle, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('متاح حالياً', style: AppTheme.subheadingStyle),
                  const Text('جاهز لاستقبال الحالات الطارئة'),
                ],
              ),
            ),
            Switch(
              value: true,
              onChanged: (value) {},
              activeColor: AppTheme.secondary,
            ),
          ],
        ),
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
            Text('المؤهلات والشهادات', style: AppTheme.subheadingStyle),
            const SizedBox(height: 16),
            _buildQualificationItem(
              'بكالوريوس طب وجراحة',
              '2015 - جامعة الملك سعود',
              'شهادة معتمدة',
            ),
            _buildQualificationItem(
              'دورة إسعافات أولية متقدمة',
              '2016 - الهلال الأحمر السعودي',
              'معتمدة دولياً',
            ),
            _buildQualificationItem(
              'شهادة BLS',
              '2020 - الجمعية الأمريكية للقلب',
              'سارية المفعول',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQualificationItem(String title, String date, String status) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.verified, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(date, style: const TextStyle(color: Colors.grey)),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ),
                const Divider(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviews() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            title:
                Text('التقييمات والمراجعات', style: AppTheme.subheadingStyle),
            trailing: TextButton(
              onPressed: () {},
              child: const Text('عرض الكل'),
            ),
          ),
          _buildReviewItem(
            'محمد علي',
            4.5,
            'خدمة ممتازة وسرعة في الاستجابة',
            '2 أيام',
          ),
          _buildReviewItem(
            'سارة أحمد',
            5.0,
            'مسعف محترف ومتعاون جداً',
            'أسبوع',
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(
      String name, double rating, String comment, String time) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
          const SizedBox(height: 8),
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
          const SizedBox(height: 8),
          Text(comment),
          const Divider(),
        ],
      ),
    );
  }
}
