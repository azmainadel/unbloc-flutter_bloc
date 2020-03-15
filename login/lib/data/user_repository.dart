import 'package:flutter/cupertino.dart';
import 'package:random_string/random_string.dart';

class UserRepository {
  Future<String> authenticate(
      {@required String userName, @required String password}) async {
    await Future.delayed(Duration(seconds: 1));

    //return a token for authentication
    return randomAlphaNumeric(12);
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));

    return;
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));

    return;
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));

    return false;
  }
}
