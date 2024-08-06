import 'package:flutter/material.dart';

class LoadingViewmodel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
