import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../app/components/widgets/custom_toast.dart';

class Util {

  static Future<bool> check() async {

    final bool isConnected = await InternetConnectionChecker.instance.hasConnection;
    if (isConnected) {
      return true;
    } else {
      return false;
    }
  }

  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void showToast(String body) {
    CustomToast().showToast(body);
  }

}

