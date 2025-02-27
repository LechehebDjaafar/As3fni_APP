import 'package:flutter/foundation.dart';
import '../models/user.dart';

class AppState with ChangeNotifier {
  User? _currentUser;
  List<User> _nearbyParamedics = [];
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  List<User> get nearbyParamedics => _nearbyParamedics;
  bool get isLoading => _isLoading;

  void setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void setNearbyParamedics(List<User> paramedics) {
    _nearbyParamedics = paramedics;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
