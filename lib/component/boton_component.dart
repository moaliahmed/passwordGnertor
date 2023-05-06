import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

class BottonComponent extends StatelessWidget {
  final text;
  final function ;

   BottonComponent({ this.text, this.function} );

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: function,
      child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 55.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.greenColor),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
    );
  }
}