import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app/components/widgets/custom_toast.dart';

class Util {

  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void showToast(String body) {
    CustomToast().showToast(body);
  }

}

