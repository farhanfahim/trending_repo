import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:trending_repo/app/data/models/trending_repo_response_model.dart';
import '../../../../../../utils/dimens.dart';
import '../../../components/resources/app_colors.dart';
import '../../../components/resources/app_images.dart';
import '../../../components/resources/strings_enum.dart';
import '../../../components/widgets/circle_image.dart';
import '../../../components/widgets/my_text.dart';

class ErrorWidgetView extends StatelessWidget {

  final Function()? onTap;
  ErrorWidgetView({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          const Spacer(),
          Lottie.asset(
            'assets/animation/animation.json', // Path to your Lottie file
            width: 350,
            height: 350,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: AppDimen.contentPadding,),
          const MyText(
            text: Strings.someThingWentWrong,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          const SizedBox(height: AppDimen.verticalPadding,),
          const MyText(
            text: Strings.anAlienIsProbablyBlocking,
            color: AppColors.grey,
            fontSize: 14,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimen.pagesHorizontalPaddingNew),
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // Rounded border
                    side: const BorderSide(color: AppColors.green), // Border color
                  ),
                  padding: const EdgeInsets.symmetric(vertical:  AppDimen.buttonPadding,),
                ),
                child: const Text(
                  Strings.retry,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: AppColors.green),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}