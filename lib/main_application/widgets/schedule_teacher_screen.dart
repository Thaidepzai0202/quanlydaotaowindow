import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/add_class_teacher/add_class_teacher_bloc.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/logger.dart';
import 'package:quanlydaotao/models/class_model.dart';
import 'package:quanlydaotao/widget/schedule_item_widget.dart';

class ScheduleTeacherScreen extends StatefulWidget {
  const ScheduleTeacherScreen({super.key});

  @override
  State<ScheduleTeacherScreen> createState() => _ScheduleTeacherScreenState();
}

class _ScheduleTeacherScreenState extends State<ScheduleTeacherScreen> {
  List<ClassRoomModel> _listClass = [];
  List<Widget> schedule = [];
  List<Widget> schedule2 = [];
  List<List<ClassRoomModel?>> classRooms =
      List.generate(10, (i) => List.filled(10, null));

  @override
  void initState() {
    _listClass = BlocProvider.of<AddClassTeacherBloc>(context).listClass;
    logger.log(_listClass.map((e) => e.toJson()));
    logger.log("ccc");
    super.initState();
    _listClass.forEach((e) {
      List<int> listSession =
          e.classSession.split(",").map((e0) => int.parse(e0)).toList();
      logger.log(listSession);
      for (var i = 0; i < listSession.length; i++) {
        classRooms[int.parse(e.dayOfWeek)][listSession[i]] = e;
      }
    });
    schedule = classRooms
        .map((e) {
          int ca = 0;
          List<Widget> sessionWidget = e.map((e0) {
            return ScheduleItemWidget(
              index: ca++,
              classRoomModel: e0,
            );
          }).toList();
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: sessionWidget.sublist(1, 6));
        })
        .toList()
        .sublist(2, 8);
    for (var i = 0; i < schedule.length; i++) {
      schedule2.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30),
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
              child: Text("Thứ ${i + 2}",style: AppTextStyles.text18BoldBlack ,)),
          schedule[i]
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.white),
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Spacer(),
              _scheduleWidget(),
              Spacer(),
            ],
          ))
        ],
      ),
    );
  }

  Widget _scheduleWidget() {
    return Column(children: schedule2);
  }
}
