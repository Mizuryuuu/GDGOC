import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _user;
  String? get user => _user;

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    if(username == "dodo" && password == "rahasia") {
      _user = username;
      _isLoading = true;
      notifyListeners();
      return true;
    } else {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(BuildContext context, String username, String email, String password, String confirmPassword) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    if(username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Column can't empty!"),
          duration: Duration(seconds: 2),
        )
      );
      return false;
    }

    if(email.contains("@")) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Email not valid!"),
            duration: Duration(seconds: 2),
          )
      );
      return false;
    }

    if(password.length < 6) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password must 6 character!"),
            duration: Duration(seconds: 2),
          )
      );
      return false;
    }

    if(password != confirmPassword) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Confirm password doesn't match!"),
            duration: Duration(seconds: 2),
          )
      );
      return false;
    }

    _user = username;
    _isLoading = false;
    notifyListeners();
    return true;
  }

  void logout() {
    _user = null;
    notifyListeners();
  }

}