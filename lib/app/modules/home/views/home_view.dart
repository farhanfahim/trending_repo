import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../repository/home_repository.dart';
import '../view_model/home_view_model.dart';
class HomeView extends StatelessWidget {

  HomeViewModel viewModel = Get.put(HomeViewModel(repository: Get.find<HomeRepository>()));

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          return Future.delayed(const Duration(seconds: 2), () {
            //viewModel.refreshData();
          });
        },
        child: Container()
      ),
    );
  }
}
