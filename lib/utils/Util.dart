import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app/components/widgets/custom_toast.dart';

class Util {

  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void showToast(String body) {
    CustomToast().showToast(body);
  }

}

