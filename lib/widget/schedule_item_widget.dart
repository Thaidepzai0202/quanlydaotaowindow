import 'package:flutter/material.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/models/class_model.dart';
import 'package:quanlydaotao/widget/subject_information_dialog.dart';

class ScheduleItemWidget extends StatelessWidget {
  final int index;
  final ClassRoomModel? classRoomModel;
  const ScheduleItemWidget(
      {super.key, this.classRoomModel, required this.index});

  @override
  Widget build(BuildContext context) {
    if (classRoomModel == null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.gray.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(3, 3), // changes position of shadow
                ),
                BoxShadow(
                  color: AppColors.gray.withOpacity(0.1),
                  spreadRadius: 0.2,
                  blurRadius: 2,
                  offset: Offset(-1, -1), // changes position of shadow
                ),
              ]),
          child: Text(
            "$index",
            style: AppTextStyles.text15W500Gray,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            showDialog(context: context, builder:(context) => SubjectInformationDialog(classRoomModel: classRoomModel!),);
          },
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: Gradients.gradientRed,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gray.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                  BoxShadow(
                    color: AppColors.gray.withOpacity(0.1),
                    spreadRadius: 0.2,
                    blurRadius: 2,
                    offset: Offset(-1, -1), // changes position of shadow
                  ),
                ]),
            child: Text(
              "$index",
              style: AppTextStyles.text15W500White,
            ),
          ),
        ),
      );
    }
  }
}
