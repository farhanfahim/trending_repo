import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:trending_repo/app/data/models/trending_repo_response_model.dart';
import '../../../../../../utils/dimens.dart';
import '../../../components/resources/app_colors.dart';
import '../../../components/resources/app_images.dart';
import '../../../components/widgets/circle_image.dart';
import '../../../components/widgets/my_text.dart';

class RepoTile extends StatelessWidget {

  final TrendingRepoResponseModel model;
  final Function()? onTap;
  RepoTile({required this.model, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(() => Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  AppDimen.allPadding,vertical: AppDimen.pagesVerticalPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  model.buildBy!.first.avatar!=null?CircleImage(
                    imageUrl: model.buildBy!.first.avatar,
                    size: 10.w,
                    border: false,
                  ):CircleImage(
                    image: AppImages.user,
                    size: 10.w,
                    border: false,
                  ),


                  const SizedBox(width: AppDimen.contentPadding,),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MyText(
                                text: model.buildBy!.first.by??"",
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                                fontSize: 14,
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: AppDimen.verticalSpacing,),
                        MyText(
                          text: model.desc??"",
                          color: AppColors.grey,
                          fontSize: 13,
                        ),
                        const SizedBox(height: AppDimen.verticalSpacing,),
                        Row(
                          children: [
                            Text(
                              model.lang??"",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.star, size: 14, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              "${model.stars??""}",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal:  AppDimen.allPadding),
              width: double.maxFinite,
              height: 0.4,
              color: AppColors.grey.withOpacity(0.6),
            ),
          ],
        ),
      ),)
    );
  }
}