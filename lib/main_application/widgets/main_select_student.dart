import 'package:flutter/material.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/constants/string_constants.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/main.dart';
import 'package:quanlydaotao/main_application/screen/main_layout_student.dart';

class MainSelectStudent extends StatefulWidget {
  const MainSelectStudent({super.key});

  @override
  State<MainSelectStudent> createState() => _MainSelectStudentState();
}

class _MainSelectStudentState extends State<MainSelectStudent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 450,
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              mainLayoutSelectStudent.value = MainLayoutSelectStudent.showClass;
            },
              child: const Text(
            StringConst.listClass,
            style: AppTextStyles.text15W500Black,
          )),
          const Padding(
            padding:  EdgeInsets.all(8.0),
            child: Divider(
              height: 1,
              color: AppColors.gray,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical :18.0),
            child: Text(
              "Thời khóa biểu",
              style: AppTextStyles.text15W500Black,
            ),
          ),
        ],
      ),
    );
  }
}
