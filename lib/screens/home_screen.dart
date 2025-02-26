import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أسعفني'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/paramedic'),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'ابحث عن مسعف قريب',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // سيتم تغييره لاحقاً بقائمة المسعفين الفعلية
              itemBuilder: (context, index) {
                return ParamedicCard();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // سيتم إضافة وظيفة طلب مسعف طارئ
        },
        label: const Text('طلب مسعف طارئ'),
        icon: const Icon(Icons.emergency),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class ParamedicCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.medical_services),
        ),
        title: const Text('اسم المسعف'),
        subtitle: const Text('المسافة: 2.5 كم'),
        trailing: IconButton(
          icon: const Icon(Icons.call),
          onPressed: () {
            // سيتم إضافة وظيفة الاتصال
          },
        ),
      ),
    );
  }
}
