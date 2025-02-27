import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class MedicalHistory extends StatelessWidget {
  const MedicalHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: AppTheme.primary,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'الأمراض المزمنة'),
              Tab(text: 'الأدوية'),
              Tab(text: 'التقارير الطبية'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildChronicDiseases(),
                _buildMedications(),
                _buildMedicalReports(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChronicDiseases() {
    return ListView.builder(
      itemCount: _chronicDiseases.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final disease = _chronicDiseases[index];
        return Card(
          child: ListTile(
            leading: Icon(Icons.medical_services, color: AppTheme.primary),
            title: Text(disease['name']),
            subtitle: Text('منذ: ${disease['since']}'),
            trailing: disease['controlled']
                ? const Chip(
                    label: Text('تحت السيطرة'),
                    backgroundColor: Colors.green,
                    labelStyle: TextStyle(color: Colors.white),
                  )
                : const Chip(
                    label: Text('متابعة مستمرة'),
                    backgroundColor: Colors.orange,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildMedications() {
    return ListView.builder(
      itemCount: _medications.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final medication = _medications[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      medication['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      medication['frequency'],
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('الجرعة: ${medication['dosage']}'),
                Text('المدة: ${medication['duration']}'),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: medication['remaining'] / medication['total'],
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                ),
                const SizedBox(height: 4),
                Text(
                  'المتبقي: ${medication['remaining']} من ${medication['total']}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMedicalReports() {
    return ListView.builder(
      itemCount: _medicalReports.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final report = _medicalReports[index];
        return Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.description, color: Colors.white),
            ),
            title: Text(report['title']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('الطبيب: ${report['doctor']}'),
                Text('التاريخ: ${report['date']}'),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {
                // تحميل التقرير
              },
            ),
          ),
        );
      },
    );
  }

  static final List<Map<String, dynamic>> _chronicDiseases = [
    {
      'name': 'السكري',
      'since': '2018',
      'controlled': true,
    },
    {
      'name': 'ضغط الدم',
      'since': '2019',
      'controlled': true,
    },
    // ... المزيد من الأمراض
  ];

  static final List<Map<String, dynamic>> _medications = [
    {
      'name': 'ميتفورمين',
      'dosage': '500mg',
      'frequency': 'مرتين يومياً',
      'duration': '3 أشهر',
      'remaining': 45,
      'total': 90,
    },
    // ... المزيد من الأدوية
  ];

  static final List<Map<String, dynamic>> _medicalReports = [
    {
      'title': 'تقرير فحص السكري',
      'doctor': 'د. أحمد محمد',
      'date': '2023/12/01',
    },
    // ... المزيد من التقارير
  ];
}
