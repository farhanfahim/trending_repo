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
  static const Duration cacheDuration = Duration(hours: 1);

  @override
  void onInit() {
    super.onInit();
    getTrendingRepos();
  }

  Future<dynamic>  getTrendingRepos({bool isRefresh = false}) async {


    isDataLoading.value = isRefresh ? false : true;
    isError.value = false;

    final cachedData = await AppPreferences.getCachedData();
    final lastFetchTime = await AppPreferences.getFetchTimeData();

    if (!isRefresh && cachedData.isNotEmpty && lastFetchTime.isNotEmpty) {
      final lastFetch = DateTime.parse(lastFetchTime);
      final isStale = DateTime.now().difference(lastFetch) > cacheDuration;

      if (!isStale) {
        // Use cached data if it's not stale
        List<dynamic> jsonList = jsonDecode(cachedData);
        List<TrendingRepoResponseModel> trendingRepos =
        jsonList.map((json) => TrendingRepoResponseModel.fromJson(json)).toList();
        isDataLoading.value = false;
        list.value = trendingRepos;
        return;
      }
    }

      var map = {
        'since': "daily"
      };

      final result = await repository.getTrendingRepo(map);
      result.fold((l) {

        isDataLoading.value = false;
        isError.value = true;
        errorMessage.value = l.message;
      }, (response) {

        // Cache the data and timestamp
        AppPreferences.setCachedData(data: jsonEncode(response));
        AppPreferences.setFetchTimeData(data: DateTime.now().toIso8601String());

        isDataLoading.value = false;
        list.value = response;

      });


  }

  void refreshData() {
    isError.value = false;
    errorMessage.value = '';
      if(list.isNotEmpty) {
        list.clear();
        list.refresh();
        AppPreferences.clearPreference();
      }
    getTrendingRepos(isRefresh: true);
  }
}
