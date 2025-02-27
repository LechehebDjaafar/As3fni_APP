import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../theme/app_theme.dart';

class SearchParamedicsTab extends StatefulWidget {
  const SearchParamedicsTab({super.key});

  @override
  State<SearchParamedicsTab> createState() => _SearchParamedicsTabState();
}

class _SearchParamedicsTabState extends State<SearchParamedicsTab> {
  final LatLng _center = const LatLng(36.7538, 3.0588); // موقع الجزائر العاصمة
  late GoogleMapController _mapController;
  bool _showList = false;

  final List<Map<String, dynamic>> _dummyParamedics = [
    {
      'name': 'د. كريم مالك',
      'speciality': 'إسعافات أولية متقدمة',
      'rating': 4.8,
      'distance': 2.5,
      'available': true,
      'phone': '0550 12 34 56',
      'location': 'حي بلوزداد، الجزائر العاصمة',
      'image': 'https://i.pravatar.cc/150?img=8',
    },
    {
      'name': 'د. سارة عمراني',
      'speciality': 'طب طوارئ',
      'rating': 4.9,
      'distance': 3.2,
      'available': true,
      'phone': '0770 98 76 54',
      'location': 'باب الزوار، الجزائر العاصمة',
      'image': 'https://i.pravatar.cc/150?img=5',
    },
    // ... المزيد من المسعفين
  ];

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // التعامل مع رفض الإذن
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('نحتاج إلى إذن الموقع لعرض المسعفين القريبين')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Position>(
        future: Geolocator.getCurrentPosition(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final currentPosition = snapshot.data!;
          return Stack(
            children: [
              GoogleMap(
                onMapCreated: (controller) => _mapController = controller,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentPosition.latitude, currentPosition.longitude),
                  zoom: 14,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: _createMarkers(),
              ),
              _buildSearchBar(),
              _buildParamedicsList(),
              _buildEmergencyButton(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Positioned(
      top: 50,
      left: 16,
      right: 16,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'ابحث عن مسعف قريب',
                    border: InputBorder.none,
                  ),
                  onTap: () => setState(() => _showList = true),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {
                  // عرض خيارات التصفية
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: const MarkerId('1'),
        position: _center,
        infoWindow: const InfoWindow(title: 'د. أحمد محمد'),
      ),
      // ... المزيد من المسعفين
    };
  }

  Widget _buildParamedicsList() {
    if (!_showList) return const SizedBox.shrink();

    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: 10,
            itemBuilder: (context, index) {
              return _buildParamedicCard();
            },
          ),
        );
      },
    );
  }

  Widget _buildEmergencyButton() {
    return Positioned(
      bottom: 16,
      right: 16,
      child: FloatingActionButton.extended(
        onPressed: () {
          // طلب إسعاف طارئ
        },
        backgroundColor: Colors.red,
        label: const Text('طلب إسعاف طارئ'),
        icon: const Icon(Icons.emergency),
      ),
    );
  }

  Widget _buildParamedicCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('https://i.pravatar.cc/150?img=8'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'د. أحمد محمد',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'إسعافات أولية متقدمة',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Text(' 4.8'),
                          const SizedBox(width: 16),
                          Icon(Icons.location_on,
                              color: AppTheme.primary, size: 18),
                          const Text(' 2.5 كم'),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.circle,
                                    color: Colors.green, size: 8),
                                SizedBox(width: 4),
                                Text(
                                  'متاح',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // طلب مساعدة فورية
                    },
                    icon: const Icon(Icons.emergency),
                    label: const Text('طلب مساعدة فورية'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    // عرض الملف الشخصي
                  },
                  icon: const Icon(Icons.info_outline),
                  color: AppTheme.primary,
                ),
                IconButton(
                  onPressed: () {
                    // اتصال
                  },
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ... المزيد من الدوال المساعدة
}
