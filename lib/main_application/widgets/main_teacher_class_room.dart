import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/add_class_teacher/add_class_teacher_bloc.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/constants/string_constants.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/main.dart';
import 'package:quanlydaotao/models/class_model.dart';
import 'package:quanlydaotao/main_application/screen/do_class_teacher_view.dart';

class MainTeacherClassRoom extends StatefulWidget {
  const MainTeacherClassRoom({super.key});

  @override
  State<MainTeacherClassRoom> createState() => _MainTeacherClassRoomState();
}

class _MainTeacherClassRoomState extends State<MainTeacherClassRoom> {
  List<ClassRoomModel> filteredItems = [];
  @override
  void initState() {
    BlocProvider.of<AddClassTeacherBloc>(context)
        .add(ShowClassEvent(mscb: authTeacher.mscb));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddClassTeacherBloc, AddClassTeacherState>(
      builder: (context, state) {
        if (state.status == AddClassStatus.showSuccessClass) {
          filteredItems = state.listClass!;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Container(
                      width: double.infinity,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          // border: Border(
                          //     bottom:
                          //         BorderSide(width: 1, color: AppColors.gray)),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.gray.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset:
                                  Offset(3, 3), // changes position of shadow
                            ),
                          ]),
                      child: const Text(
                        StringConst.listSubject,
                        style: AppTextStyles.text15W500Black,
                      )),
                ),

                // searchWidget(),

                Expanded(
                  child: ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoClassTeacherView(
                                  classRoomModel: filteredItems[index],
                                ),
                              ));
                        },
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.gray.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(
                                      3, 3), // changes position of shadow
                                ),
                                BoxShadow(
                                  color: AppColors.gray.withOpacity(0.1),
                                  spreadRadius: 0.2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      -1, -1), // changes position of shadow
                                ),
                              ]),
                          padding: const EdgeInsets.all(18),
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 450,
                                    child: Text(
                                        "${index + 1} . ${filteredItems[index].dataSubject!.subjectName} - ${filteredItems[index].subjectId}"),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                        "Kỳ học :  ${filteredItems[index].semester}"),
                                  ),
                                  // Text(filteredItems[index].dataSubject!.subjectName),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Phòng học : ${filteredItems[index].className}"),
                                  Text(
                                      "Lịch học  : Ca ${filteredItems[index].classSession} - Thứ ${filteredItems[index].dayOfWeek}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
