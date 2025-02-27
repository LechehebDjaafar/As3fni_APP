import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class AppProvider with ChangeNotifier {
  bool _isLoading = false;
  Position? _currentLocation;
  String _selectedUserType = '';

  bool get isLoading => _isLoading;
  Position? get currentLocation => _currentLocation;
  String get selectedUserType => _selectedUserType;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setUserType(String type) {
    _selectedUserType = type;
    notifyListeners();
  }

  Future<void> getCurrentLocation() async {
    try {
      setLoading(true);
      _currentLocation = await Geolocator.getCurrentPosition();
      notifyListeners();
    } catch (e) {
      debugPrint('Error getting location: $e');
    } finally {
      setLoading(false);
    }
  }
}
