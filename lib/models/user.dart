class User {
  final String id;
  final String name;
  final String phone;
  final String imageUrl;
  final String type; // 'paramedic' or 'patient'
  final double rating;
  final Map<String, dynamic> location;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.imageUrl,
    required this.type,
    this.rating = 0.0,
    required this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      imageUrl: json['imageUrl'],
      type: json['type'],
      rating: json['rating']?.toDouble() ?? 0.0,
      location: json['location'],
    );
  }
}
