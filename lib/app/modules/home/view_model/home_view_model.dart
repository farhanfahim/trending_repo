import 'package:get/get.dart';
import '../../../data/models/trending_repo_response_model.dart';
import '../../../repository/home_repository.dart';

class HomeViewModel extends GetxController {


  final HomeRepository repository;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
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

    }, (response) {

      if(isRefresh) {
        if(list.isNotEmpty) {
          list.clear();
        }
      }
        list.value = response.data;
    });
  }

  void refreshData() {
    isError.value = false;
    errorMessage.value = '';
    getTrendingRepos(isRefresh: true);
  }
}
