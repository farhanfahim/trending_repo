import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/dimens.dart';
import '../widgets/Skeleton.dart';

class ListingShimmer extends StatelessWidget {
  const ListingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimen.horizontalPadding.w,
        vertical: AppDimen.verticalPadding.h,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 150.0, height: 15.0, child: Skeleton()),
          SizedBox(height: 5.0),
          SizedBox(width: 100.0, height: 15.0, child: Skeleton()),
        ],
      ),
    );
  }
}
