class ParamedicsData {
  static final List<Map<String, dynamic>> paramedics = [
    {
      'id': '1',
      'name': 'د. كمال بوزيان',
      'speciality': 'طب استعجالي',
      'experience': '8 سنوات',
      'rating': 4.8,
      'totalRatings': 127,
      'phone': '0770 12 34 56',
      'wilaya': 'الجزائر العاصمة',
      'address': 'شارع ديدوش مراد، الجزائر العاصمة',
      'available': true,
      'certifications': [
        'دكتوراه في الطب - جامعة الجزائر',
        'شهادة في الإسعافات الأولية المتقدمة',
        'عضو في الهيئة الوطنية للإسعاف الطبي',
      ],
      'languages': ['العربية', 'الفرنسية'],
      'services': [
        'إسعافات أولية',
        'رعاية طارئة',
        'نقل المرضى',
        'استشارات طبية',
      ],
      'workingHours': '24/7 للحالات الطارئة',
      'image': 'https://i.pravatar.cc/300?img=8',
    },
    {
      'id': '2',
      'name': 'د. نادية مرزوق',
      'speciality': 'إسعافات متقدمة',
      'experience': '5 سنوات',
      'rating': 4.9,
      'totalRatings': 93,
      'phone': '0550 98 76 54',
      'wilaya': 'الجزائر العاصمة',
      'address': 'حيدرة، الجزائر العاصمة',
      'available': true,
      'certifications': [
        'ماجستير في الطب الاستعجالي - جامعة وهران',
        'شهادة في طب الطوارئ',
      ],
      'languages': ['العربية', 'الفرنسية', 'الإنجليزية'],
      'services': [
        'رعاية طبية طارئة',
        'إسعافات أولية',
        'متابعة صحية',
      ],
      'workingHours': '8:00 - 20:00',
      'image': 'https://i.pravatar.cc/300?img=5',
    },
    {
      'id': '3',
      'name': 'د. رضا بلقاسم',
      'speciality': 'طب الطوارئ',
      'experience': '10 سنوات',
      'rating': 4.7,
      'totalRatings': 156,
      'phone': '0661 23 45 67',
      'wilaya': 'الجزائر العاصمة',
      'address': 'باب الزوار، الجزائر العاصمة',
      'available': true,
      'certifications': [
        'دكتوراه في الطب - جامعة قسنطينة',
        'تخصص في طب الطوارئ',
        'شهادة في الإنعاش القلبي الرئوي',
      ],
      'languages': ['العربية', 'الفرنسية'],
      'services': [
        'علاج طارئ',
        'إسعافات أولية',
        'نقل المرضى',
        'رعاية منزلية',
      ],
      'workingHours': '24/7 للحالات الطارئة',
      'image': 'https://i.pravatar.cc/300?img=11',
    },
  ];

  static List<Map<String, dynamic>> getAvailableParamedics() {
    return paramedics.where((p) => p['available'] == true).toList();
  }

  static Map<String, dynamic>? getParamedicById(String id) {
    try {
      return paramedics.firstWhere((p) => p['id'] == id);
    } catch (e) {
      return null;
    }
  }

  static final Map<String, String> emergencyNumbers = {
    'الحماية المدنية': '14',
    'الشرطة': '17',
    'الإسعاف': '115',
    'الدرك الوطني': '1055',
  };
}
