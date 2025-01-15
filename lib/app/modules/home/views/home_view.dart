import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trending_repo/app/components/resources/app_colors.dart';
import 'package:trending_repo/app/components/shimmers/listing_shimmer.dart';
import 'package:trending_repo/app/modules/home/widgets/error_widget_view.dart';
import 'package:trending_repo/app/modules/home/widgets/repo_tile.dart';
import '../../../../utils/dimens.dart';
import '../../../components/resources/strings_enum.dart';
import '../../../components/widgets/my_text.dart';
import '../../../repository/home_repository.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  HomeViewModel viewModel =
      Get.put(HomeViewModel(repository: Get.find<HomeRepository>()));

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(Strings.trending, style: TextStyle(fontSize: 24)),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return Future.delayed(const Duration(seconds: 2), () {
            viewModel.refreshData();
          });
        },
        child: Obx(
          () => viewModel.isDataLoading.value
              ? const ListingShimmer()
              : viewModel.isError.value? ErrorWidgetView(onTap: (){
                viewModel.getTrendingRepos();
              })
              : ListView.builder(
                  itemCount: viewModel.list.length,
                  itemBuilder: (context, index) {
                    return RepoTile(model: viewModel.list[index]);
                  }),
        ),
      ),
    );
  }
}
