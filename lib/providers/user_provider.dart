


import 'package:animation/model/user_details.dart';
import 'package:animation/service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier{
  List<Userdetails> _details = [];
  final ApiService _apiservice= ApiService();

  List<Userdetails> get details => _details;

  Future<void> fetchItems() async {
    try {
      _details = await _apiservice.fetchItems();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching items: $e');
      }
    }
  }
}
