import 'package:flutter/material.dart';

class ParamedicScreen extends StatefulWidget {
  const ParamedicScreen({super.key});

  @override
  State<ParamedicScreen> createState() => _ParamedicScreenState();
}

class _ParamedicScreenState extends State<ParamedicScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل مسعف'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.camera_alt, size: 50),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'الاسم الكامل',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'الرجاء إدخال الاسم';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'رقم الهاتف',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'الرجاء إدخال رقم الهاتف';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'المؤهلات الطبية',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // سيتم إضافة وظيفة حفظ البيانات
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('تسجيل كمسعف'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
