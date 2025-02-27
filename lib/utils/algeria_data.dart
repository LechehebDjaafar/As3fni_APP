class AlgeriaData {
  static final List<Map<String, dynamic>> wilayas = [
    {'id': '16', 'name': 'الجزائر العاصمة', 'lat': 36.7538, 'lng': 3.0588},
    {'id': '31', 'name': 'وهران', 'lat': 35.6987, 'lng': -0.6349},
    {'id': '19', 'name': 'سطيف', 'lat': 36.1898, 'lng': 5.4108},
    {'id': '09', 'name': 'البليدة', 'lat': 36.4722, 'lng': 2.8278},
    {'id': '15', 'name': 'تيزي وزو', 'lat': 36.7166, 'lng': 4.0474},
    // ... يمكن إضافة باقي الولايات
  ];

  static final List<String> phoneFormats = [
    '0550 XX XX XX',
    '0551 XX XX XX',
    '0555 XX XX XX',
    '0556 XX XX XX',
    '0560 XX XX XX',
    '0561 XX XX XX',
    '0665 XX XX XX',
    '0666 XX XX XX',
    '0667 XX XX XX',
    '0770 XX XX XX',
    '0771 XX XX XX',
    '0772 XX XX XX',
  ];

  static String formatAlgerianPhone(String number) {
    if (number.length == 10) {
      return '${number.substring(0, 4)} ${number.substring(4, 6)} ${number.substring(6, 8)} ${number.substring(8)}';
    }
    return number;
  }
}
