import 'dart:convert';

import 'package:get/get.dart';
import 'package:trending_repo/shared_prefrences/app_prefrences.dart';
import '../../../data/models/trending_repo_response_model.dart';
import '../../../repository/home_repository.dart';

class HomeViewModel extends GetxController {

  final HomeRepository repository;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
  RxString oldData = ''.obs;
  RxBool isDataLoading = false.obs;
  HomeViewModel({required this.repository});
  RxList<TrendingRepoResponseModel> list = List<TrendingRepoResponseModel>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    getTrendingRepos();
  }

  Future<dynamic>  getTrendingRepos({bool isRefresh = false}) async {

    isDataLoading.value = isRefresh ? false : true;

    var map = {
      'since': "daily"
    };

    final result = await repository.getTrendingRepo(map);
    result.fold((l) {

      isDataLoading.value = false;
      isError.value = true;
      errorMessage.value = l.message;
      print(errorMessage.value);
    }, (response) {

      if(isRefresh) {
        if(list.isNotEmpty) {
          list.clear();
          AppPreferences.clearPreference();
        }
      }
      //AppPreferences.setData(data: json. response.data);
        list.value = response.data;
      print("farhan");
      print(response.data);
      print(list.length);
    });
  }

  void refreshData() {
    isError.value = false;
    errorMessage.value = '';
    getTrendingRepos(isRefresh: true);
  }
}
