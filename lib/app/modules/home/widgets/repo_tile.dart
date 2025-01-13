import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../utils/dimens.dart';
import '../../../components/resources/app_colors.dart';
import '../../../components/resources/app_images.dart';
import '../../../components/widgets/circle_image.dart';
import '../../../components/widgets/my_text.dart';

class RepoTile extends StatelessWidget {

  final String model;
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
                 /* model.user!.userImage!=null?CircleImage(
                    imageUrl: model.user!.userImage!.mediaUrl!,
                    size: 10.w,
                    border: false,
                  ):*/CircleImage(
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
                                text: "title",
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                                fontSize: 14,
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: AppDimen.verticalSpacing,),
                        MyText(
                          text: "sub title",
                          color: AppColors.grey,
                          fontSize: 13,
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