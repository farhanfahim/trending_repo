import 'package:get/get.dart';

import '../modules/home/views/home_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NOTIFICATION;
  static final routes = [

    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => HomeView(),
    ),

  ];
}
