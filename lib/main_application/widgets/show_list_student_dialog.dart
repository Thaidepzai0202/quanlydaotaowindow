import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlydaotao/bloc/classroom_teacher/class_room_teacher_bloc.dart';
import 'package:quanlydaotao/core/constants/app_text_style.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';

class ShowListStudentInClass extends StatefulWidget {
  final String classID;
  const ShowListStudentInClass({super.key, required this.classID});

  @override
  State<ShowListStudentInClass> createState() => _ShowListStudentInClassState();
}

class _ShowListStudentInClassState extends State<ShowListStudentInClass> {
  @override
  void initState() {
    BlocProvider.of<ClassRoomTeacherBloc>(context)
        .add(ShowListStudentEvent(classID: widget.classID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<ClassRoomTeacherBloc, ClassRoomTeacherState>(
        builder: (context, state) {
          if (state.status == ClassRoomStatus.success) {
            return Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Container(
                    height: 40,
                    width: 500,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: Gradients.gradientRed,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: const Text(
                      "Danh sách học sinh trong lớp",
                      style: AppTextStyles.text16BoldWhite,
                    )),
                Expanded(
                    child: ListView.builder(
                        itemCount: state.listStudent!.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state
                                      .listStudent![index].dataStudent!.name),
                                  Text(state.listStudent![index].mssv)
                                ],
                              ),
                            )))
              ]),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
