import 'package:flutter/material.dart';
import 'package:apna_store/const/AppColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CustomButton(String buttonText, onPressed) {
  return SizedBox(
    width: 1.sw,
    height: 56.h,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white, fontSize: 18.sp),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        elevation: 3,
      ),
    ),
  );
}
