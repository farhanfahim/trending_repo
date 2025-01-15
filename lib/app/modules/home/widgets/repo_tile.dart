import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  AppDimen.allPadding,vertical: AppDimen.pagesVerticalPaddingNew),
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                hasIcon: false,
                useInkWell: false
              ),
              header: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  model.buildBy!.first.avatar!=null?CircleImage(
                    imageUrl: model.buildBy!.first.avatar,
                    size: 36,
                    border: false,
                  ):const CircleImage(
                    image: AppImages.user,
                    size: 36,
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
                                text: model.buildBy!.first.by!.substring(1)??"",
                                color: AppColors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimen.verticalSpacing,),
                        Row(
                          children: [
                            Expanded(
                              child: MyText(
                                text: model.repo!.substring(1)??"",
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimen.verticalSpacing,),
                      ],
                    ),
                  )

                ],
              ),
              collapsed: const SizedBox(),
              expanded: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 42,),

                  const SizedBox(width: AppDimen.contentPadding,),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: model.desc??"",
                          color: AppColors.black,
                          fontSize: 13,
                        ),
                        const SizedBox(height: AppDimen.verticalSpacing,),
                        Row(
                          children: [
                            Container(
                              width: 8.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: Colors.green, // Set the circle color to green
                                borderRadius: BorderRadius.circular(25.0), // Makes the container circular
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              model.lang??"",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
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
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal:  AppDimen.allPadding),
            width: double.maxFinite,
            height: 0.5,
            color: AppColors.grey.withOpacity(0.6),
          ),
        ],
      )
    );
  }
}