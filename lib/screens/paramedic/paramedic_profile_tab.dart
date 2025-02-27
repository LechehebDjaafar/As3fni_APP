import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/paramedics_data.dart';

class ParamedicProfileTab extends StatelessWidget {
  const ParamedicProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام بيانات المسعف الأول كمثال
    final paramedicData = ParamedicsData.paramedics[0];

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(paramedicData),
          _buildStats(paramedicData),
          _buildInfo(paramedicData),
          _buildAvailabilityCard(),
          _buildQualifications(paramedicData),
          _buildServices(paramedicData),
          _buildWorkingHours(paramedicData),
        ],
      ),
    );
  }

  Widget _buildHeader(Map<String, dynamic> data) {
    return Stack(
      children: [
        Container(
          height: 200,
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
                  backgroundImage: NetworkImage(data['image']),
                ),
                const SizedBox(height: 8),
                Text(
                  data['name'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  data['speciality'],
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStats(Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('التقييم', '${data['rating']}', Icons.star),
          _buildStatItem(
              'عدد التقييمات', '${data['totalRatings']}', Icons.people),
          _buildStatItem('الخبرة', data['experience'], Icons.access_time),
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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildInfo(Map<String, dynamic> data) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('المعلومات الشخصية', style: AppTheme.subheadingStyle),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.phone, 'رقم الهاتف', data['phone']),
            _buildInfoRow(Icons.location_on, 'العنوان', data['address']),
            _buildInfoRow(Icons.location_city, 'الولاية', data['wilaya']),
            _buildInfoRow(
                Icons.language, 'اللغات', data['languages'].join('، ')),
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
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.check_circle, color: Colors.white),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('متاح حالياً',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('جاهز لاستقبال الحالات الطارئة'),
                ],
              ),
            ),
            Switch(
              value: true,
              onChanged: (value) {},
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQualifications(Map<String, dynamic> data) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('المؤهلات والشهادات', style: AppTheme.subheadingStyle),
            const SizedBox(height: 16),
            ...data['certifications']
                .map<Widget>((cert) => _buildCertificationItem(cert)),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificationItem(String certification) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.verified, color: Colors.green, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(certification)),
        ],
      ),
    );
  }

  Widget _buildServices(Map<String, dynamic> data) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('الخدمات المقدمة', style: AppTheme.subheadingStyle),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: data['services'].map<Widget>((service) {
                return Chip(
                  label: Text(service),
                  backgroundColor: AppTheme.primary.withOpacity(0.1),
                  labelStyle: TextStyle(color: AppTheme.primary),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkingHours(Map<String, dynamic> data) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        leading: Icon(Icons.access_time, color: AppTheme.primary),
        title: const Text('ساعات العمل'),
        subtitle: Text(data['workingHours']),
      ),
    );
  }
}
